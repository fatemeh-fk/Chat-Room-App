//
//  RegisterViewController.swift
//  ChatRoom App
//
//  Created by Fateme Karimi on 2021-09-15.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passTxtField: UITextField!
    
    @IBAction func registerPressed(_ sender: Any) {
    print ("hello")
        if let email = emailTxtField.text, let password = passTxtField.text{
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error{
                print(e.localizedDescription)
            }else{
                self.performSegue(withIdentifier: Constants.signupSegue, sender: self)
            }
          }
        }
    }
    

   

}
