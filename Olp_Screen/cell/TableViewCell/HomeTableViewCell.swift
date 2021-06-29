//
//  HomeTableViewCell.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 05/05/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    var models = [mainModel]()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension HomeTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.confige(with: models[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: collectionView.frame.size.width / 2.2
                      ,height: collectionView.frame.size.height )
    }
}

