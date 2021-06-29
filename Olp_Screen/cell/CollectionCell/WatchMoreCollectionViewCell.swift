//
//  WatchMoreCollectionViewCell.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 11/05/21.
//

import UIKit

class WatchMoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var pImage: UIImageView!
    @IBOutlet var descLbl: UILabel!
    var cellClicked : ((Int) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//    func mainItem(with model:mainModel){
//        
//        self.pImage.image = UIImage(named: model.image)
//        self.titleLbl.text = model.title
//        self.descLbl.text = model.des
//        
//    }
    func setData(_ image: String ,title:String , desc: String){
        
        let s = image
        let url = URL(string: s)
        self.pImage.kf.setImage(with: url)
        self.titleLbl.text = title
        self.descLbl.text = desc
      
    }
}
