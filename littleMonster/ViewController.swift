//
//  ViewController.swift
//  littleMonster
//
//  Created by Khaled Rahman Ayon on 12/06/16.
//  Copyright © 2016 iosApp. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

   
    @IBOutlet var reStartBtn: UIButton!
    @IBOutlet var goBackBtn: UIButton!
    @IBOutlet var heartImg: DragImg!
    @IBOutlet var foodImg: DragImg!
    @IBOutlet weak var monsterImg: MonsterImg!
    
    @IBOutlet var penalty1Img: UIImageView!
    @IBOutlet var penalty2Img: UIImageView!
    @IBOutlet var penalty3Img: UIImageView!
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    
    let DIM_Skull: CGFloat = 0.2
    let OPAQUE: CGFloat = 1
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer!
    
    var monsterHappy = false
    var currentItem = 0
    
    
    
    
    override func viewDidLoad() {
        
        penalty1Img.alpha = DIM_Skull
        penalty2Img.alpha = DIM_Skull
        penalty3Img.alpha = DIM_Skull
        
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDropedOnCharacter:", name: "onTargetDroped", object: nil)
        
        startTimer()
        
        do {
            
            try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxSkull.prepareToPlay()
            sfxSkull.prepareToPlay()
            
        }catch let err as NSError {
            
            print(err.debugDescription)
        }
    }
    
    
    func startTimer() {
        
        if timer != nil {
        
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
        
    }
    
    func changeGameState() {
        
        if !monsterHappy {
        
            penalties++
            
            if penalties == 1 {
                penalty1Img.alpha = OPAQUE
                penalty2Img.alpha = DIM_Skull
                
            }else if penalties == 2 {
                penalty2Img.alpha = OPAQUE
                penalty3Img.alpha = DIM_Skull
                
            }else if penalties >= 3 {
                penalty3Img.alpha = OPAQUE
                
            }else {
                penalty1Img.alpha = DIM_Skull
                penalty2Img.alpha = DIM_Skull
                penalty3Img.alpha = DIM_Skull
            }
            
            if penalties >= MAX_PENALTIES {
                gameOver()
            }
        
        }
        
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            foodImg.alpha = DIM_Skull
            foodImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
        }else {
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
            
            heartImg.alpha = DIM_Skull
            heartImg.userInteractionEnabled = false
        }
        
        currentItem = rand
        monsterHappy = false
       
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImg.playDeathMonster()
        sfxDeath.play()
        reStartBtn.hidden = false
        goBackBtn.hidden = false
        
    }
    
    func itemDropedOnCharacter (notif: AnyObject){
        
        monsterHappy = true
        startTimer()
        
        foodImg.alpha = DIM_Skull
        foodImg.userInteractionEnabled = false
        
        heartImg.alpha = DIM_Skull
        heartImg.userInteractionEnabled = false
        
        if currentItem == 0 {
        
            sfxHeart.play()
        }else {
            
            sfxBite.play()
        }
    }
    
    @IBAction func goToMenuScreenPressed(sender: AnyObject) {
        
        musicPlayer.stop()
        performSegueWithIdentifier("MonsterBack", sender: nil)
        
    }
    @IBAction func onReStartPressed(sender: AnyObject) {
        reStartBtn.hidden = true
        goBackBtn.hidden = true
        
        monsterImg.playIdleMonster()
        penalties = 0

        
        penalty1Img.alpha = DIM_Skull
        penalty2Img.alpha = DIM_Skull
        penalty3Img.alpha = DIM_Skull
        
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDropedOnCharacter:", name: "onTargetDroped", object: nil)
        
        startTimer()
        
        
    }
    

}