//
//  AccountCreateViewController.swift
//  miniChat
//
//  Created by rtc hubs on 10/31/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class AccountCreateViewController: UIViewController,UITextFieldDelegate {


    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var createAcountPressed: UIButton!
    @IBOutlet weak var chooseAvaterPressed: UIButton!
    
    @IBOutlet weak var userIdText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    var bgColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordText.delegate = self
        
        setUpView()
        
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        if  UserDataService.instance.avaterName != ""{
        
            userImage.image = UIImage(named: UserDataService.instance.avaterName )
            
            if(UserDataService.instance.avaterName.contains("light") && bgColor == nil ){
                userImage.backgroundColor = UIColor.lightGray
            
            }
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }


    @IBAction func closeCreateAccountBtnPressed(_ sender: Any) {
        
       dismiss(animated : true , completion: nil)
        
        

    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: Any) {
        
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat (arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r , green: g , blue: b , alpha: 0.8)
        
        UIView.animate(withDuration: 0.2) { 
             self.userImage.backgroundColor = self.bgColor
        }
        
       
    }
    
    @IBAction func chooseAvaterPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATER_PICKER , sender: nil)
        
    }
    
    

    @IBAction func createdAcountPressed(_ sender: Any) {
        
        guard  let email = emailText.text , emailText.text != "" else {return}
        guard let password = passwordText.text , passwordText.text != "" else {return}
        guard let name = userNameText.text , userNameText.text != "" else {return}
        guard let uid = userIdText.text , userIdText.text != "" else {return}

        spinner.isHidden = false
        spinner.startAnimating()
        
        AuthService.instance.registerUser(email: email,name: name,uid: uid, password: password) {
            (success) in
            if success {
                print("registered user !")
                
                AuthService.instance.loginUser(email: uid, password: password, completion: { (success) in
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                    if(success)
                    {
                    }
                })
                
             self.spinner.isHidden = true
            }
        }
    }
    
    
    func setUpView(){
        spinner.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector (AccountCreateViewController.handleTap))
        view.addGestureRecognizer(tap)
    
    }
    
    func handleTap()
    {
        view.endEditing(true)
    }
    
}
