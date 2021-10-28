//
//  ViewController.swift
//  ChatRoom App
//
//  Created by Fateme Karimi on 2021-09-14.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    //navigation bar hidden
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = Constants.appName
//        titleLabel.text = ""
//        var charIndex = 0.0
//     let  titleText = "Chat Room"
//        for letter  in titleText {
//
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
//                self.titleLabel.text?.append(letter)
//            }
//            charIndex += 1
//        }
        
    }


}

