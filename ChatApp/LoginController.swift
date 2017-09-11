//
//  ViewController.swift
//  ChatApp
//
//  Created by Andrew Piterov on 10/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtn_click(_ sender: Any) {
        self.performSegue(withIdentifier: "showProfile", sender: sender)
    }

}

