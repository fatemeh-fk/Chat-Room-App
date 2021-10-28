//
//  LoginViewController.swift
//  ChatRoom App
//
//  Created by Fateme Karimi on 2021-09-15.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emaiTxtfield: UITextField!
    
    @IBOutlet weak var passTxtField: UITextField!
    
    @IBAction func loginPressed(_ sender: Any) {
        
        if let email = emaiTxtfield.text, let password = passTxtField.text{
        Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
            if let e = error {
                print(e)
                
            }else{
                
                self.performSegue(withIdentifier: Constants.siginSegue, sender: self)
            }
          
          // ...
        }
    }
    }
    

}
