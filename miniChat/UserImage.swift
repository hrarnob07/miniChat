//
//  Gradientview.swift
//  miniChat
//
//  Created by rtc hubs on 10/31/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

@IBDesignable
class UserImage: UIImageView {
    
    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView()
    {
    
    self.layer.cornerRadius = self.frame.width / 2
    self.clipsToBounds  = true
        
    }
    
    
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
        
        setUpView()
    }
    
}
