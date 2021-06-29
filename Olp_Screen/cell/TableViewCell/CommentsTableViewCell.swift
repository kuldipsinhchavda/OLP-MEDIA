//
//  CommentsTableViewCell.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 11/05/21.
//

import UIKit

class CommentsTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet var userPhoto: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var comments: UILabel!
    @IBOutlet var replyTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
       // replyTextField.isHidden = true
       // replyTextField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     func comments(_ comments : String) {
        
        self.comments.text = comments
    }
    
    
    @IBAction func reply(_ sender: UIButton) {
        
        //replyTextField.isHidden = false
        
        
    }
}
