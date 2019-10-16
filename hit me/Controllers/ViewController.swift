//
//  ViewController.swift
//  hit me
//
//  Created by ahmad$$ on 10/16/19.
//  Copyright © 2019 ahmad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var toBeGuesedValueLabel: UILabel!
    var currentValue = 0
    var targetValue = 0
    var rounds = 01
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundValue = slider.value.rounded()
        currentValue = Int(roundValue)
        
        toDefaultRound()
    }

    @IBAction func resetButtonPressed(_ sender: Any) {
        rounds = 0
        score = 0
        updateUI()
    }
    @IBAction func hitMeBurronPressed(_ sender: Any) {
        let diffrenece = abs(targetValue - currentValue)
        var points = 100 - diffrenece
        var title:String
        if diffrenece == 0 {
            title = "Perfect!"
            points += 100
        }else if diffrenece < 5 {
            title = "Almost had it!"
            if diffrenece == 1 {
                points += 50
            }
        }else if diffrenece < 10 {
            title = "Prettey good!"
        }else{
            title = "not even close... "
        }

         score += points
        let message = "your score is \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: { action in
            self.toDefaultRound()
        })
        alert.addAction(action)
        present(alert,animated: true,completion: nil  )
        rounds += 1
    }
    
    @IBAction func valueSlider(_ sender: UISlider) {
        let roundValue = sender.value.rounded()
        currentValue = Int(roundValue)
        
    }
    
    func toDefaultRound(){
        targetValue = Int.random(in: 1...100)
        toBeGuesedValueLabel.text! = String(targetValue)
        currentValue = 50
        slider.value = Float(currentValue)
        updateUI()

    }
    func checkScore(){
    
    }
    func updateUI(){
        toBeGuesedValueLabel.text! = String(targetValue)
        roundLabel.text! = String(rounds)
        scoreLabel.text! = String(score)
    }
}

