//
//  MonsterImg.swift
//  littleMonster
//
//  Created by Khaled Rahman Ayon on 12/06/16.
//  Copyright © 2016 iosApp. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        playIdleMonster()
    }
    
    func playIdleMonster () {
        
        var imageArray = [UIImage]()
        
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        for var x = 1; x <= 4; x++ {
            
            var img = UIImage(named:"idle\(x).png")
            
            imageArray.append(img!)
        }
        
        self.animationImages = imageArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathMonster() {
        
        var imageArray = [UIImage]()
        
        self.image = UIImage(named: "dead5.png")
        self.animationImages = nil
        
        for var x = 1; x <= 5; x++ {
            
            var img = UIImage(named:"dead\(x).png")
            
            imageArray.append(img!)
        }
        
        self.animationImages = imageArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
}