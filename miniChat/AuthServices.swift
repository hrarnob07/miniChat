//
//  AuthServices.swift
//  miniChat
//
//  Created by rtc hubs on 11/1/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService  {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get{
         return defaults.bool(forKey : LOGGED_IN_KEY)
        }
        
        set {
            defaults.set(newValue, forKey : LOGGED_IN_KEY)
        }
    
    }
    
    var authToken : String {
    
        get{
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue , forKey : USER_EMAIL)
        }
    }
    
    
    var userEmail : String {
        get{
        
            return defaults.value(forKey : USER_EMAIL) as! String
        }
        set{
            defaults.set(newValue , forKey : USER_EMAIL )
        }
        
    
    }
    
    var userName : String {
        get{
            
            return defaults.value(forKey : USER_NAME) as! String
        }
        set{
            defaults.set(newValue , forKey : USER_NAME )
        }
        
        
    }
    
    var userUid : String {
        get{
            
            return defaults.value(forKey : USER_UID) as! String
        }
        set{
            defaults.set(newValue , forKey : USER_UID )
        }
        
        
    }
    
    
    func registerUser (email : String ,name: String , uid:String, password : String, completion :  @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        
        
        
        let body:[String: Any] = [
        
            "email":lowerCaseEmail,
            "name": name,
            "uid": uid,
            "password":password]
        
      /*  Alamofire.request(URL_REGISTER,  .post, parameters: body, encoding: JSONEncoding.defaults, headers: header).responseString{
            (response) in
            if response.result.error == nil {
            
               completion(true)
            }
            else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
        
        
        }
        */
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
                
                print("success<<<<<<<<<<")
                
                guard let data = response.data else{return}
                let json = JSON( data: data)
                print(json)
                
                completion(true)
            } else {
                print("error,>>>>>>>>>>>>>>>>>>>>>>")
            
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
        
    }
    
    func loginUser(email: String, password: String , completion: @escaping CompletionHandler){
    
       
        
        let body :[String: Any] = [
            
            "uid":email,
            "password":password]
 
 
        
       /* let body :[String: Any] = [
        "title": email,
        "body": "my first post",
        "userId": 1
        ]*/
        
        print(body)
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil{
                print("request successful")
                
               /* if let json =  response.result.value as? Dictionary <String , Any >{
                
                  debugPrint(json as Any)
                    
                    if let title = json["title"] as? String{
                    print(title)
                    
                    }
                    
                    if let body = json["body"] as? String{
                    print(body)
                    }
                    
                }*/
                
                guard let data = response.data else {return}
                let json = JSON(data: data)
                
                //print(json)
                
               let token = json["token"]
                print(token)
                
                self.authToken = json["token"].stringValue
                self.isLoggedIn = true
                
               // print(self.authToken)
                
                
                
                
                
                completion(true)
                
                
            }
            else{
            completion(false)
            debugPrint(response as Any)
            
            }
        }
        

        
    
    }
    
    
    
}
