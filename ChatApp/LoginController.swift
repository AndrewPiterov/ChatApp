//
//  ViewController.swift
//  ChatApp
//
//  Created by Andrew Piterov on 10/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtn_click(_ sender: Any) {
        FirebaseManager.Login(email: usernameTextBox.text!, password: passwordTextBox.text!) { (success: Bool) in
            if success{
                self.performSegue(withIdentifier: "showProfile", sender: sender)
            }
        }
    }
}

