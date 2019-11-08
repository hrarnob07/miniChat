import Foundation
import Alamofire
import SwiftyJSON

class PostService {

    static let instance = PostService()
    
    func postOnGitHubServer(message : String , completion :  @escaping CompletionHandler)
    {
    
        let body:[String: Any] = [
            
            "title": "Post By HR Arnob",
            "body": message,
            "userId": 1
           ]
        
        Alamofire.request(POST_GITHUB, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
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

}
