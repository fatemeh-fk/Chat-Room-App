//
//  MessageCell.swift
//  ChatRoom App
//
//  Created by Fateme Karimi on 2021-10-22.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var messageBubble: UIView!
    
    @IBOutlet weak var avatorYouImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
