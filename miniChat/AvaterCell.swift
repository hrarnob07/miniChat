//
//  AvaterCell.swift
//  miniChat
//
//  Created by rtc hubs on 11/4/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit
enum AvaterType {

        case dark
        case light
}
class AvaterCell: UICollectionViewCell {
    @IBOutlet weak var avaterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
   func configureCell(index : Int , type : AvaterType){
        if(type == AvaterType.dark)
        {
            avaterImage.image = UIImage( named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor

        }
        else{
            
            avaterImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor

       }
    
    }
    
    func setUpView()
    {
    
    self.layer.backgroundColor = UIColor.lightGray.cgColor
    self.layer.cornerRadius = 10
    self.clipsToBounds = true
    
    
    }





}
