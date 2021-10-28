//
//  ChatRoomViewController.swift
//  ChatRoom App
//
//  Created by Fateme Karimi on 2021-09-15.
//

import UIKit
import Firebase

class ChatRoomViewController: UIViewController {

    //@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var msgTextField: UITextField!
    
    let db = Firestore.firestore()
    var message :[Message] = [
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   tableView.delegate = self
        tableView.dataSource = self
        title = Constants.appName
        navigationItem.hidesBackButton = true
        
        //register
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        loadMessages()
        

        // Do any additional setup after loading the view.
    }
    
    func loadMessages(){
        message = []
        db.collection(Constants.FStore.collectionName)
            .order(by:Constants.FStore.dateField)
            .addSnapshotListener { (querySnapshot,error) in
            self.message = []
            if let e = error {
                print("there is an errror.\(e)")
            }else{
                if let querySnapshotDoc = querySnapshot?.documents {
                    for doc in querySnapshotDoc {
                       // print(doc.data())
                        let data = doc.data()
                        if let sender = data[Constants.FStore.senderField] as? String, let messageBody = data[Constants.FStore.bodyField] as? String{
                            let newMessage = Message(sender: sender, body: messageBody)
                            self.message.append(newMessage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.message.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                            
                            }
                        
                        
                    }
                }
            }
            
        }
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        
        if let messageBody = msgTextField.text, let messageSender = Auth.auth().currentUser?.email{
            
            db.collection(Constants.FStore.collectionName).addDocument(data: [Constants.FStore.senderField:messageSender , Constants.FStore.bodyField :messageBody,Constants.FStore.dateField:Date().timeIntervalSince1970]) { (error) in
                if let e = error {
                    print("there was an issue saving data to firestore,\(e)")
                }else{
                    print("successfully saved data.")
                    
                    DispatchQueue.main.async {
                        self.msgTextField.text = ""
                    }
                   
                }
            }
            
        }
        
        
    }
    

    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        //let firebaseAuth = Auth.auth()
    do {
      try Auth.auth().signOut()
        
        navigationController?.popToRootViewController(animated: true)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
    }
    
}
extension ChatRoomViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let msg = message[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier , for: indexPath) as! MessageCell
        //  cell.textLabel?.text = message[indexPath.row].body
        cell.label.text = msg.body
        //this is msg from curent user
        if msg.sender == Auth.auth().currentUser?.email {
            cell.avatorImageView.isHidden = false
            cell.avatorYouImage.isHidden = true
            cell.messageBubble.backgroundColor = .lightGray
            //UIColor(named: Constants.BrandColors.lightPurple)
            cell.label.textColor = .blue
            //UIColor (named: Constants.BrandColors.purple)
        }else{
            cell.avatorImageView.isHidden = true
            cell.avatorYouImage.isHidden = false
            cell.messageBubble.backgroundColor = .gray
            //UIColor(named: Constants.BrandColors.purple)
            cell.label.textColor = .blue
            //UIColor (named: Constants.BrandColors.lightPurple)
            
        }
        
        
     
        return cell
    }
    
    
}
//extension ChatRoomViewController : UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//
//}
