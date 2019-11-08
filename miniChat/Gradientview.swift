//
//  Gradientview.swift
//  miniChat
//
//  Created by rtc hubs on 10/31/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

@IBDesignable
class Gradientview: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) {
    
        didSet{
        
            self.setNeedsLayout()
        }
    
    }

    
    @IBInspectable var buttomColor: UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) {
        
        didSet{
            
            self.setNeedsLayout()
        }
        
    }
    
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [topColor.cgColor , buttomColor.cgColor ,topColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5 , y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5 , y:1)
        
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        
    }

}
