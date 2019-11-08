//
//  UserDataService.swift
//  miniChat
//
//  Created by rtc hubs on 11/4/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private (set) var id = ""
    public private (set) var avaterColor = ""
    public private (set) var avaterName = ""
    public private (set) var email = ""
    public private(set) var name = ""
    
    func setUserData( avaterColor : String, avaterName: String, name: String , email: String)
    {
      self.name = name
      self.avaterName = avaterName
      self.email = email
      self.avaterColor = avaterColor
      
    }
    
    func setAvaterName( avaterName : String)
    {
    
      self.avaterName = avaterName
    }
    
}
