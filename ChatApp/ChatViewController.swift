//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Andrew Piterov on 11/09/2017.
//  Copyright © 2017 Andrew Pierov. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedUser: AppUser?
    @IBOutlet weak var tableView: UITableView!
    var cellHeight = 44
    
    @IBOutlet weak var messageText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 88
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        PostManager.fillPosts(uid: (FirebaseManager.currentUser?.uid)!, toId: (selectedUser?.uid)!, completion: {(result: String) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        PostManager.posts = []
    }

    @IBAction func sendBtn_click(_ sender: Any) {
        PostManager.sendPost(username: (selectedUser?.uid)!, text: messageText.text!, toId: (selectedUser?.uid)!, fromId: (FirebaseManager.currentUser?.uid)!)
        messageText.text = ""
    }
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PostManager.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatTableViewCell

        let messageText = cell.messageText
        messageText?.delegate = self
        cellHeight = Int((messageText?.contentSize.height)!)
        let post = PostManager.posts[indexPath.row]
        cell.messageText.text = post.text

        return cell
     }
}

extension ChatViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
    }
}





















