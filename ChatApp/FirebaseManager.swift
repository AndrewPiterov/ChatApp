//
//  FirebaseManager.swift
//  ChatApp
//
//  Created by Andrew Piterov on 22/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseManager: NSObject {
    static let databseRef = Database.database().reference()
    static var currentUserId: String = ""
    static var currentUser: User? = nil
    
    static func Login(email: String, password: String, completion: @escaping (_ success: Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            } else {
                currentUser = user
                currentUserId = (user?.uid)!
                completion(true)
            }
        })
    }
}
