//
//  ImageService.swift
//  miniChat
//
//  Created by rtc hubs on 11/5/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class ImageService {
    static let instance = ImageService()
    var photo = [Photo]()
    
    func collectImage(completion: @escaping CompletionHandler)
    {
        Alamofire.request(IMG_URL, method: .get , headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
                print("success<<<<<<<<<<")
                guard let data = response.data else{return}
                let json = JSON( data: data)
                let alldata = json["data"]
                
                //debugPrint(alldata as Any)
                
                /*for(index , allData): (String , JSON) in alldata{
                
                
                let photo = allData["photo_path"].string
                
                    print(photo)
                
                }*/
                

                //print(alldata)
                for i in 0 ..< alldata.count{
                    //print("\(alldata[i]["photo_path"])")
                    let photoUrl  = alldata[i]["photo_path"].string
                    let photos = Photo (photoPath : photoUrl!)
            
                    self.photo.append(photos)
                    //print(photoUrl)
                    
                }
                
               // print(self.photo)
                completion(true)
            } else {
                print("error,>>>>>>>>>>>>>>>>>>>>>>")
                completion(false)
                debugPrint(response.result.error as Any)
                
            }
        }
    
    }
}
