//
//  PhotoCell.swift
//  miniChat
//
//  Created by rtc hubs on 11/7/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    
    @IBOutlet weak var ImageView: UIImageView!
   // @IBOutlet weak var ImageUrl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurePhotoCell(photo: Photo){
       // ImageUrl.text = "hr arnob"
        print(photo)
    
        //ImageUrl.text = photo.photoPath
    
       /* let url = URL(string: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/12/11/naturo-monkey-selfie.jpg?w968h681")*/
        
        let url = URL(string: photo.photoPath) 
        self.ImageView.downloadImage(from: url!)
        
        //ImageView.image = UIImage( named: "dark1")
    
    }
}


extension UIImageView {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        getData(from: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }
    }
}
