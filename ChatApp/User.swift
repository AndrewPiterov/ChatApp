//
//  User.swift
//  ChatApp
//
//  Created by Andrew Piterov on 24/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit
import FirebaseStorage

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
    
    func getProfileImage() -> UIImage {
        if let url = NSURL(string: profileImageUrl) {
            if let data = NSData(contentsOf: url as URL){
                return UIImage(data: data as Data)!
            }
        }
        return UIImage()
    }
    
    func uploadProfilePhoto(_ profileImage: UIImage){
        let profileImageref = Storage.storage().reference().child("profileImages").child("\(NSUUID().uuidString).jpg")
        
        if let imageData = UIImageJPEGRepresentation(profileImage, 0.25){
            profileImageref.putData(imageData, metadata: nil){
                (metadata, error)
                in
                if error != nil{
                    print(error as Any)
                    return
                }else{
                    print(metadata!)
                    if let downloadUrl = metadata?.downloadURL()?.absoluteString{
                        if self.profileImageUrl == ""{
                            self.profileImageUrl = downloadUrl
                            
                            FirebaseManager.databseRef.child("users").child(self.uid).updateChildValues(["profileImageUrl": downloadUrl])
                        }
                    }
                }
            }
        }
    }
}
