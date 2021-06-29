//
//  MainCatogeryTableViewCell.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 06/05/21.
//

import UIKit

class MainCatogeryTableViewCell: UITableViewCell {
    @IBOutlet var collectioView: UICollectionView!
    var categoryModels = [categoryModel]()
    var itemModels = [MainModel]()
    var cellClicked : ((Int) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectioView.register(UINib(nibName: "MainCatogeryCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MainCatogeryCollectionViewCell")
        collectioView.delegate = self
        collectioView.dataSource = self
        
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MainCatogeryTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCatogeryCollectionViewCell", for: indexPath) as! MainCatogeryCollectionViewCell
        cell.mainItem(with: categoryModels[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellClicked!(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: collectionView.frame.size.width / 2.2
                      ,height: collectionView.frame.size.height )
    }
    
}
