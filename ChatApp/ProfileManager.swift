//
//  ProfileManager.swift
//  ChatApp
//
//  Created by Andrew Piterov on 24/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ProfileManager: NSObject {
    static let databaseRef = Database.database().reference()
    static let uid = Auth.auth().currentUser?.uid
    
    static var users = [AppUser]()
    
    static func getUser(uid: String) -> AppUser? {
        if let i = users.index(where: {$0.uid == uid}){
            return users[i]
        }
        return nil
    }
    
    static func fillUsers(completion: @escaping()->Void) {
        users = []
        databaseRef.child("users").observe(.childAdded, with: { (snapshot) in
                print(snapshot)
                if let result = snapshot.value as? [String:Any] {
                    let uid = result["uid"]! as! String
                    let username = result["username"]! as! String
                    let email = result["email"]! as! String
                    let profileImageUrl = result["profileImageUrl"]! as! String
                    
                    let user = AppUser(uid: uid, username: username, email: email, profileImageUrl: profileImageUrl)
                    
                    ProfileManager.users.append(user)
                }
                completion()
            })
    }
}
