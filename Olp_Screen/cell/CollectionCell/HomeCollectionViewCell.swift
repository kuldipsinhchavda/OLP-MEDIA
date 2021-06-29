//
//  HomeCollectionViewCell.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 05/05/21.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet var title: UILabel!
    @IBOutlet var lable: UILabel!
    @IBOutlet var homeImage: UIImageView!
    @IBOutlet var desc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func confige(with model: mainModel){
        
        DispatchQueue.main.async {
            let s = model.image
            
            let url = URL(string: s)
            self.homeImage.kf.setImage(with: url)
            
            self.title.text = model.title
            self.desc.text = model.series
           
            self.lable.text = model.createdAt
        }
        
       
    }
}
