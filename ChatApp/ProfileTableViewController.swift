//
//  ProfileTableViewController.swift
//  ChatApp
//
//  Created by Andrew Piterov on 11/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    var selectedUser: AppUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableView.reloadData()
        ProfileManager.fillUsers {
            () in
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ProfileManager.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell

        let user = ProfileManager.users[indexPath.row]
        cell.cellname.text = user.username
        
        if user.profileImageUrl != "" {
            // user.getProfileImage()
        } else {
            cell.cellimage.image = #imageLiteral(resourceName: "profile")
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = ProfileManager.users[indexPath.row]
        self.performSegue(withIdentifier: "showChatView", sender: self)
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChatView" {
            if let destinationVC = segue.destination as? ChatViewController{
                destinationVC.selectedUser = selectedUser
            }
        } else if segue.identifier == "showSettingsView"{
            
        }
    }
    

}
