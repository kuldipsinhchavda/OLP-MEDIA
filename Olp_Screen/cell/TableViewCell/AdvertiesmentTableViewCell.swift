//
//  AdvertiesmentTableViewCell.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 06/05/21.
//

import UIKit
import Kingfisher

class AdvertiesmentTableViewCell: UITableViewCell {

    @IBOutlet var topicName: UILabel!
    @IBOutlet var image1: UIImageView!
    @IBOutlet var shortDesc: UILabel!
    
    var adverticeMent = [advertiseCoder]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(model : advertiseCoder){
        
        let s = model.urlImage
        
        let url = URL(string: s!)
        
        self.image1.kf.setImage(with: url)
        
        self.topicName.text = model.topicName
        
        self.shortDesc.text = model.desc
        
    }
    
}
