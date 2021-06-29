//
//  MainCatogeryCollectionViewCell.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 06/05/21.
//

import UIKit
import Kingfisher

class MainCatogeryCollectionViewCell: UICollectionViewCell {
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func mainItem(with model:categoryModel){
        
        let s = model.image
        
        let url = URL(string: s)
        mainImage.kf.setImage(with: url)
        
        //self.mainImage.image = UIImage(named: model.image)
        self.mainTitle.text = model.title
        self.desc.text = model.des
        
    }
    func setData(_ image: String ,title:String , desc: String){
        let s = image
           let url = URL(string: s)
           self.mainImage.kf.setImage(with: url)
       
        self.mainTitle.text = title
        self.desc.text = desc
      
    }

}
