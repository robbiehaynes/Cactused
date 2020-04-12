//
//  ViewController.swift
//  Cactused
//
//  Created by Robert Haynes on 2020/04/12.
//  Copyright © 2020 Haynes Developments. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var dareView: UILabel!
    @IBOutlet weak var dareBG: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    let drinking = ["Drink 1 sip of your drink","Drink 1 sip of the person's drink to your right","Drink 1 sip of the person's drink to your left","Drink 2 sips of your own drink","Unlucky! Down your drink!","Roll a dice to decide the number of sips to drink","Take a shot of your choice","The number of sips to drink is the addition of the digits of your age (Age 21 : 2+1=3 sips)","The player with the nearest birthday must drink 2 sips of their drink","Middle/oldest child - drink 2 sips","Straight arm challenge! Drink your drink with a straight arm!","Take 3 sips of your drink","Those who haven't ironed clothes in the last month; drink 3 sips","Those who haven't mowed the lawn in the last month, drink 3 sips","Anybody who hasn't left their property in the last month, drink 3 sips","Nominate a whole family (group of 2 if single players) to have 3 sips of their drink","Nominate 1 person in the game to down their drink"]
    let activities = ["Get strong! Do 20 pushups!","Get jacked! Do 20 situps!","You ready? Run around the house","Draw something and the other family/players has to guess what it is - 2 sips if failed to guess right","Charades to the rest of the players - 2 sips if failed to guess right","Make a family/group pyramid - 2 sips if failed","Sing the national anthem of your country until told to stop","Gave each other massages/Give somebody a massage until your next turn","Rule! You/Your team can't say each other's names until your next round - take sip each time the rule is broken","Dance for 15 seconds to a song of the other family's/player's choice","Rule! You/Your team are only drink with left hand for 3 rounds! - take sip each time the rule is broken","Rule! You/Your team have to Put hand on head when drinking","Challenge! Sit on a stool and move right foot clockwise and draw a 6 with your left hand - drink 5 sips upon failure","Oops! Nominate a single player to jump in the pool","Rule! You must now have both legs in the air until your next round - failure = 3 sips each time","Rule! You must now talk with a 1 second break between each word - 2 sips for each failure","As a family/gorup, make up a dare for a specific player to complete"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextTurnButtonPressed(_ sender: UIButton) {
        
    }
    
    func rollDice() -> Int {
        return Int.random(in: 1...6)
    }
    
    func generateNum() -> Int {
        return Int.random(in: 0...17)
    }
    
    func setToGreen() {
        dareBG.backgroundColor = #colorLiteral(red: 0.502, green: 0.8863, blue: 0, alpha: 1)
        dareView.textColor = UIColor.white
        dareBG.layer.cornerRadius = 30
        dareBG.layer.shadowColor = UIColor.white.cgColor
        dareBG.layer.shadowOpacity = 3
        dareBG.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dareBG.layer.shadowRadius = 10
        iconImageView.image = #imageLiteral(resourceName: "activityLogo")
    }
    
    func setToBlue() {
        dareBG.backgroundColor = #colorLiteral(red: 0, green: 0.7412, blue: 0.8863, alpha: 1)
        dareView.textColor = UIColor.white
        dareBG.layer.cornerRadius = 30
        dareBG.layer.shadowColor = UIColor.white.cgColor
        dareBG.layer.shadowOpacity = 3
        dareBG.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dareBG.layer.shadowRadius = 10
        iconImageView.image = #imageLiteral(resourceName: "drinkLogo")
    }
    
    func setToRed() {
        dareBG.backgroundColor = #colorLiteral(red: 0.9176, green: 0.2745, blue: 0, alpha: 1)
        dareView.textColor = UIColor.white
        dareBG.layer.cornerRadius = 30
        dareBG.layer.shadowColor = UIColor.white.cgColor
        dareBG.layer.shadowOpacity = 3
        dareBG.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dareBG.layer.shadowRadius = 10
        iconImageView.image = #imageLiteral(resourceName: "sadFaceIcon")
    }
    
    func fadeOutIn(num1:Int,num2:Int) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.dareBG.alpha = 0
            self.dareView.alpha = 0
            self.textView.alpha = 0
            self.iconImageView.alpha = 0
        }) { (_) in
            self.fadeIn()
            self.changeViews(diceValue: num1, generatedNum: num2)
        }
    }
    
    func fadeIn() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.dareBG.alpha = 1
            self.dareView.alpha = 1
            self.textView.alpha = 1
            self.iconImageView.alpha = 1
        }, completion: nil)
    }
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        let dice = rollDice()
        let num = generateNum()
        
        fadeOutIn(num1:dice,num2:num)
    }
    
    @IBAction func smallViewTapAction(_ sender: UITapGestureRecognizer) {
        let dice = rollDice()
        let num = generateNum()
        
        fadeOutIn(num1:dice,num2:num)
    }
    
    func changeViews(diceValue:Int,generatedNum:Int) {
        if diceValue<4 {
            if generatedNum == 17 {
                textView.text = "FORFEIT"
                dareView.text = "Oh no! Add your drink to the forfeit glass"
                setToRed()
                playSound(sound: "gasp", type: "mp3")
            } else {
                textView.text = "DRINK"
                dareView.text = "\(drinking[generatedNum])"
                setToBlue()
                playSound(sound: "cheers", type: "mp3")
            }
        } else {
            if generatedNum == 17 {
                textView.text = "FORFEIT"
                dareView.text = "Oh no! Add your drink to the forfeit glass"
                setToRed()
                playSound(sound: "gasp", type: "mp3")
            } else {
                textView.text = "ACTIVITY"
                dareView.text = "\(activities[generatedNum])"
                setToGreen()
                playSound(sound: "ohno", type: "mp3")
            }
        }
    }
    
}

