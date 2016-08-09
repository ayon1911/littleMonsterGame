//
//  MenuVCViewController.swift
//  littleMonster
//
//  Created by Khaled Rahman Ayon on 20/06/16.
//  Copyright © 2016 iosApp. All rights reserved.
//

import Foundation
import UIKit

class MenuVCViewController: UIViewController {

    @IBOutlet var heroImg: UIImageView!
    @IBOutlet var unKnownEnemyImg: UIImageView!
    @IBOutlet var monsterSmallImg: UIImageView!
    @IBOutlet var blueImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroIdleplay()
        unKnownEnemyIdle()
        monsterSmallIdel()
        blueCreatureIdle()
    }
    
    //Hero Character
    func heroIdleplay() {
        
        var imgArray = [UIImage]()
        heroImg.image = UIImage(named: "heroIdle1.png")
        
        for var x = 1; x <= 4; x++ {
            var img = UIImage(named: "heroIdle\(x).png")
            imgArray.append(img!)
        }
        heroImg.animationImages = imgArray
        heroImg.animationDuration = 0.8
        heroImg.animationRepeatCount = 0
        heroImg.startAnimating()
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "someMethod:")
        heroImg.userInteractionEnabled = true
        self.view.addGestureRecognizer(tapGesture)
    }
    
    //UnknownEnemy 
    func unKnownEnemyIdle() {
        var imgArray = [UIImage]()
        unKnownEnemyImg.image = UIImage(named: "UnKnownEnemy1.png")
        
        for var x = 1; x <= 4; x++ {
            var img = UIImage(named: "UnKnownEnemy\(x).png")
            imgArray.append(img!)
        }
        unKnownEnemyImg.animationImages = imgArray
        unKnownEnemyImg.animationDuration = 0.8
        unKnownEnemyImg.animationRepeatCount = 0
        unKnownEnemyImg.startAnimating()
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "someMethod:")
        monsterSmallImg.userInteractionEnabled = true
        self.view.addGestureRecognizer(tapGesture)

    }
    
    //MonsterSmall
    
    func monsterSmallIdel() {
        var imgArray = [UIImage]()
        monsterSmallImg.image = UIImage(named: "MonsterSmall_Idle1.png")
        
        for var x = 1; x <= 4; x++ {
            var img = UIImage(named: "MonsterSmall_Idle\(x).png")
            imgArray.append(img!)
        }
        monsterSmallImg.animationImages = imgArray
        monsterSmallImg.animationDuration = 0.8
        monsterSmallImg.animationRepeatCount = 0
        monsterSmallImg.startAnimating()
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "someMethod:")
        monsterSmallImg.userInteractionEnabled = true
        self.view.addGestureRecognizer(tapGesture)
    }
    
    //BlueCreature 
    
    func blueCreatureIdle() {
        var imgArray = [UIImage]()
        blueImg.image = UIImage(named: "blue_idle1.png")
        
        for var x = 1; x <= 4; x++ {
            var img = UIImage(named: "blue_idle\(x).png")
            imgArray.append(img!)
        }
        blueImg.animationImages = imgArray
        blueImg.animationDuration = 0.8
        blueImg.animationRepeatCount = 0
        blueImg.startAnimating()
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "someMethod:")
        blueImg.userInteractionEnabled = true
        self.view.addGestureRecognizer(tapGesture)

    }
    
    func someMethod(tapGesture: UITapGestureRecognizer) {
        performSegueWithIdentifier("Monster", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
