//
//  ChatViewController.swift
//  miniChat
//
//  Created by rtc hubs on 10/31/19.
//  Copyright © 2019 rtc hubs. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var MessageTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        MessageTable.delegate = self
        MessageTable.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        setUpView()
        
        
    }
    
    
  
    @IBAction func sendMessagePressed(_ sender: Any) {
        
        guard   let message = messageText.text , messageText.text != "" else {
            return
        }
        spinner.isHidden = false
        spinner.startAnimating()
        let chatText = Message (message : message)
        MessageService.instance.message.append(chatText)
        
        let p = MessageService.instance.message[0]
        
        print(p)
        
        //print(MessageService.instance.message.getMessage()[0])
        MessageTable.reloadData()
        
        
        PostService.instance.postOnGitHubServer(message: message) { (success) in
            if(success)
            {
                print("post done")
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
                self.messageText.text = ""
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MessageService.instance.message.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("hello")
        
        if let cell = MessageTable.dequeueReusableCell(withIdentifier: "messageCell") as? MessageViewCell{
            
            let message = MessageService.instance.message[indexPath.row]
            print(message)
            cell.updateTableviews(message: message )
            
            return cell
        }
        else {
             print()
            return MessageViewCell()
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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    


   

}

