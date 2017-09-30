//
//  ViewController.swift
//  ChatApp
//
//  Created by Andrew Piterov on 10/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RemoteConfigManager.remoteConfigInit(firstControl: self.loginBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtn_click(_ sender: Any) {
        FirebaseManager.Login(email: email.text!, password: password.text!) { (success: Bool) in
            if success{
                self.performSegue(withIdentifier: "showProfile", sender: sender)
            }
        }
    }
    @IBAction func createAcountBtn_click(_ sender: Any) {
        FirebaseManager.CreateAccount(email: email.text!, username: username.text!, password: password.text!){
            (result: String)
            in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showProfile", sender: sender)
            }
        }
    }
}

