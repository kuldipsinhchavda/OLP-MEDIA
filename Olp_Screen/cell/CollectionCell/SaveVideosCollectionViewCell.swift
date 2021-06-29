//
//  SaveVideosCollectionViewCell.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 29/04/21.
//

import UIKit
import Kingfisher

class SaveVideosCollectionViewCell: UICollectionViewCell {

    @IBOutlet var videoImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var desc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        videoImage.layer.borderWidth=1.0
       // profilePic.layer.masksToBounds = false
        videoImage.layer.borderColor = UIColor.white.cgColor
        videoImage.layer.cornerRadius = 5
        videoImage.clipsToBounds = true
    }
    
    func confige(with model: addVideos){
        
        DispatchQueue.main.async {
            let s = model.image
            
            let url = URL(string: s)
            self.videoImage.kf.setImage(with: url)
            
            self.title.text = model.title
            self.desc.text = model.des
           
            
        }
       
       
    }

    
    
    func setData(_ image: String ,title:String , desc: String){
        
     let s = image
        let url = URL(string: s)
        self.videoImage.kf.setImage(with: url)
        
      
        self.title.text = title
        self.desc.text = desc
      
    }

}

struct addVideos {
    
    var title: String
    var image: String
    var des: String
    
    init(title: String,image:String,desc:String) {
        
        self.title = title
        self.des = desc
        self.image = image
    }
}
