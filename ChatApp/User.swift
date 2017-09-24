//
//  User.swift
//  ChatApp
//
//  Created by Andrew Piterov on 24/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

class AppUser: NSObject {
    var username: String
    var email: String
    var uid: String
    var profileImageUrl: String
    
    init(uid: String, username: String, email: String, profileImageUrl: String){
        self.uid = uid
        self.username = username
        self.email = email
        self.profileImageUrl = profileImageUrl
    }
    
}
