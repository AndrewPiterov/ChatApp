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
    
    static func CreateAccount(email: String, username: String, password: String, completion: @escaping(_ result: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: {
            (user, error)
            in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            AddUser(username: username, email: email)
            Login(email: email, password: password){
                success
                in
                if success{
                    print("Login successful after account creation")
                } else {
                    print("Login unsuccessful after account creation")
                }
            }
            completion("")
        })
    }
    
    static func AddUser(username: String, email: String) {
        let uid = Auth.auth().currentUser?.uid
        let post = ["uid": uid,
                    "username": username,
                    "email": email,
                    "profileImageUrl": ""]
        
        databseRef.child("users").child(uid!).setValue(post)
    }
}
