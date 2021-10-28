//
//  Constants.swift
//  ChatRoom App
//
//  Created by Fateme Karimi on 2021-10-21.
//

struct Constants{
    static let appName = "Chat Room"
    static let cellIdentifier = "ReusableCell"
       static let cellNibName = "MessageCell"
      
       
       struct BrandColors {
           static let purple = "BrandPurple"
           static let lightPurple = "BrandLightPurple"
           static let blue = "BrandBlue"
           static let lighBlue = "BrandLightBlue"
       }
       
       struct FStore {
           static let collectionName = "messages"
           static let senderField = "sender"
           static let bodyField = "body"
           static let dateField = "date"
       }

     static let signupSegue = "RegisterToChat"
   static let siginSegue = "LoginToChat"
}
