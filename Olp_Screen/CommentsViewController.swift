//
//  CommentsViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 19/05/21.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet var cmtTextView: UITextView!
    @IBOutlet var cmtLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        cmtTextView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func send(_ sender: UIButton) {
    }


}

extension CommentsViewController: UITextViewDelegate{
    
//    func textViewDidChange(_ textView: UITextView) {
//        if cmtTextView.contentSize.height > 100 {
//            textViewHeight
//        }
//    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if cmtTextView.text == "" {
            cmtTextView.text = "Write your commment"
            
        }
        else if cmtTextView.text == "Write your comment"
        {
            cmtTextView.text = ""
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if cmtTextView.text == "" {
            cmtTextView.text = "Write your commment"
        }
    }
}
