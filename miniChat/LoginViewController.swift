//
//  LoginViewController.swift
//  miniChat
//
//  Created by rtc hubs on 10/31/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var userPasswordText: UITextField!
    @IBOutlet weak var userUidText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        
        //dismiss(animated: true, completion : nil)
        dismiss(animated: true , completion : nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)

    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        print("going for login")
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let userID = userUidText.text , userUidText.text != "" else {return}
        
        guard let password = userPasswordText.text , userPasswordText.text != "" else {return}
        
        AuthService.instance.loginUser(email: userID, password: password) { (
            success) in
             self.spinner.isHidden = true
             self.spinner.stopAnimating()
            if (success)
            {
                
                print(success)
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
