//
//  TestViewController.swift
//  miniChat
//
//  Created by rtc hubs on 11/5/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var photoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        photoTableView.delegate = self
        photoTableView.dataSource = self
    }
    
    @IBAction func CloseApp(_ sender: Any) {
        dismiss(animated:  true , completion: nil)
    }
    
    @IBAction func collectImagePressed(_ sender: Any) {
        //spinner.transform = CGAffineTransform(scaleX: 1, y: 3)
        spinner.isHidden = false
        spinner.startAnimating()
        
        ImageService.instance.collectImage { (success) in
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
            if(success)
            {
                print("now call to photo table ------>")
                self.photoTableView.reloadData()
            }
            else {
                print("false")
            }
        }
        
        
    }
    
    func setUpView()
    {
        spinner.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector (ChatViewController.handleTap))
        view.addGestureRecognizer(tap)
        
    }
    
    func handleTap()
    {
        view.endEditing(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("table view call --->")
        
        if let cell = photoTableView.dequeueReusableCell(withIdentifier: "photoCell") as? PhotoCell{
            
            let photo = ImageService.instance.photo[indexPath.row]
            print(photo)
            cell.configurePhotoCell(photo: photo)
            
            return cell
        }
        else {
            
            return PhotoCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ImageService.instance.photo.count
    }
    


}
