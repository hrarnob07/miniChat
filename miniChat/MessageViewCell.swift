//
//  MessageViewCell.swift
//  miniChat
//
//  Created by rtc hubs on 11/4/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class MessageViewCell: UITableViewCell {
    @IBOutlet weak var messageText : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateTableviews(message: Message)
    {
        
          print(message.message)
          messageText.text = message.message
    }
    
    

    

}
