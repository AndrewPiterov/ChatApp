//
//  SettingsViewController.swift
//  ChatApp
//
//  Created by Andrew Piterov on 11/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    var selectedUser: AppUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        username.text = selectedUser?.username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getPhotoBtn_click(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true, completion: nil)
    }
    
    @IBAction func updateBtn_click(_ sender: Any) {
        uploadPhoto()
    }
    
    func uploadPhoto(){
        self.selectedUser?.uploadProfilePhoto(imageView.image!)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickerInfo: NSDictionary = info as NSDictionary
        let image: UIImage = pickerInfo.object(forKey: UIImagePickerControllerOriginalImage) as! UIImage
        imageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
