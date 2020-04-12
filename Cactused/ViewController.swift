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
    
    let drinking = ["Take 1 sip of your drink","Take 1 sip of the drink to your right","Take 1 sip of the drink to your left","Take 2 sips","Down your drink","Roll a dice for number of sips","Take a shot of your choice","Sip the addition of the digits of your age","Nearest birthday - have 2 sips","Middle/oldest child - have 2 sips","Straight arm challenge","Take 3 sips","Those who haven't ironed your clothes, take 3 sips","Those who haven't mowed the lawn, take 3 sips","Anybody who hasn't left their property, take 3 sips","Nominate a whole family to have a sip","Nominate 1 person in the game to down their drink"]
    let activities = ["Do 20 pushups","Do 20 situps","Run around house","Draw something and the other family has to guess what it is","Charades - 3 sips if fail","Make a family pyramid","Sing the national anthem","Gave each other massages","Can't say each other's names until the next round - take sip if failed","Dance for 15 seconds - other family chooses song","Only drink with left hand","Put hand on head when drinking","Sit on a stool and move right foot around right and right hand draw a six - fail = down drink","Nominate anyone to jump in the pool","Have both legs in the air until next round (deadbug) - fail = 3 sips","Talk with 1 sec break in between each word","As a family, make up a dare for a specific person"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextTurnButtonPressed(_ sender: UIButton) {
        let dice = rollDice()
        let num = generateNum()
        
        if dice<4 {
            if num == 17 {
                textView.text = "FORFEIT"
                dareView.text = "Add your drink to the forfeit glass"
                setToRed()
            } else {
                textView.text = "DRINKING"
                dareView.text = "\(drinking[num])"
                setToBlue()
            }
        } else {
            if num == 17 {
                textView.text = "FORFEIT"
                dareView.text = "Add your drink to the forfeit glass"
                setToRed()
            } else {
                textView.text = "ACTIVITY"
                dareView.text = "\(activities[num])"
                setToGreen()
            }
        }
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
        dareBG.layer.shadowColor = UIColor.black.cgColor
        dareBG.layer.shadowOpacity = 3
        dareBG.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dareBG.layer.shadowRadius = 10
    }
    
    func setToBlue() {
        dareBG.backgroundColor = #colorLiteral(red: 0, green: 0.7412, blue: 0.8863, alpha: 1)
        dareView.textColor = UIColor.white
        dareBG.layer.cornerRadius = 30
        dareBG.layer.shadowColor = UIColor.black.cgColor
        dareBG.layer.shadowOpacity = 3
        dareBG.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dareBG.layer.shadowRadius = 10
    }
    
    func setToRed() {
        dareBG.backgroundColor = #colorLiteral(red: 0.9176, green: 0.2745, blue: 0, alpha: 1)
        dareView.textColor = UIColor.white
        dareBG.layer.cornerRadius = 30
        dareBG.layer.shadowColor = UIColor.black.cgColor
        dareBG.layer.shadowOpacity = 3
        dareBG.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        dareBG.layer.shadowRadius = 10
    }
    
}

