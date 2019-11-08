//
//  MessageService.swift
//  miniChat
//
//  Created by rtc hubs on 11/4/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import Foundation
class MessageService{
    
    static let instance = MessageService()
    
    public  var message = [
        Message(message: "Hello, I am arnob"),
        Message(message: "Hello, I am hr arnob"),
        Message(message: "Hello ,I am arnob Akon"),
        
        ]
    
    func getMessage()->[Message]{
        
        return message
    }
}
