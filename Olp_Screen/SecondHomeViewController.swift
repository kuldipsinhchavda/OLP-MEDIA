//
//  SecondHomeViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 10/05/21.
//

import UIKit
import Kingfisher
import AVKit
import AVFoundation
class SecondHomeViewController: UIViewController {
    @IBOutlet var homeImage: UIImageView!
    @IBOutlet var comments: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var playBtn: NSLayoutConstraint!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var questionBtn: UIButton!
    @IBOutlet var desc: UILabel!
    @IBOutlet var binBtn: UIButton!
    @IBOutlet var heartBtn: UIButton!
    @IBOutlet var commentImg: UIImageView!
    
    public var saveVide = [addVideos]()
    var mainModels = [mainModel]()
    var categoryModels = [categoryModel]()
    let imageArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7")]
    

    @IBOutlet var tableViewHieght: NSLayoutConstraint!
    var titlePhoto : String?
    var titleLable1 : String?
    var titleDesc :  String?
    var categoryId : Int?
    var commentsArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let s = titlePhoto
        let url = URL(string: s!)
        self.homeImage.kf.setImage(with: url)
        titleLable.text = titleLable1
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        collectionView.delegate = self
        collectionView.dataSource = self
        desc.text = titleDesc
        
        var categoryData = [String : Any]()
        categoryData["category_id"] = categoryId
       
        commenWs.GETURL(url: CATEGORYDETAILSURL, dict: categoryData) { (response, status) in
            
            if let data = response["data"] as? [String:Any] {
                
                if let category = data["category"] as? [String:Any]{
                    
                    if let videos = category["videos"] as? [NSDictionary]{
                        
                        for video in videos {
                            
                            do{
                            let data = try JSONSerialization.data(withJSONObject: video, options: .prettyPrinted)
                                let reqStr = String(data: data, encoding: .utf8)
                                let strToData = reqStr?.data(using: .utf8)
                                let videosData = try JSONDecoder().decode(VideoModel.self, from: strToData!)
                                let title = videosData.videoTitle
                                let mainImage = videosData.videoCover
                                let desc = videosData.shortDescription
                                let id = videosData.categoryId
                                let addData = categoryModel(title: title ?? "" , image: mainImage ?? "", desc: desc ?? "", categoryId: id ?? 55)
                                self.collectionView.reloadData()
                                self.categoryModels.append(addData)
                            }
                            catch{}
                        }
                    }
                   
                }
               
                
            }
            
        }
        
        
        
        
        tableView.register(UINib(nibName: "CommentsTableViewCell", bundle: .main), forCellReuseIdentifier: "CommentsTableViewCell")
        collectionView.register(UINib(nibName: "WatchMoreCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "WatchMoreCollectionViewCell")
      
    }
  
    
    public func imageAnimation (sender: UIButton) {
        
        UIView.animate(withDuration: 0.5,delay: 0.1,options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            sender.isSelected = !sender.isSelected
            
        }){(success) in
            
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {sender.transform = .identity}, completion: nil)
        }
    }
    
    
    
    func getthumbNailFromImage(url : URL,completion : @escaping((_ Image : UIImage) -> Void)){
        DispatchQueue.global().async {
            let asset = AVAsset(url: url)
            let assetImageGen = AVAssetImageGenerator(asset: asset)
            assetImageGen.appliesPreferredTrackTransform = true
            
            let thumbnailTime = CMTimeMake(value: 7, timescale: 1)
            do{
                let cgThumbImage = try assetImageGen.copyCGImage(at: thumbnailTime, actualTime: nil)
                let thumbImage = UIImage(cgImage: cgThumbImage)
                
                DispatchQueue.main.async {
                    completion(thumbImage)
                }
            }
            catch{
                
                print(error.localizedDescription)
            }
        }
    }
    
    
    @IBAction func play(_ sender: UIButton) {
        
        imageAnimation(sender: sender)
        
    }
    
    @IBAction func heart(_ sender: UIButton) {
        imageAnimation(sender: sender)
        
        let saveArray = addVideos(title: titleLable1!, image: titlePhoto!, desc: titleDesc!)
        self.saveVide.append(saveArray)
        print(self.saveVide)
        
      //  saveVideo.setData(UIImage(named: titlePhoto!)!, title: titleLable1!, desc: titleDesc!)
        
//        commenWs.getURL(url: CATEGORY_URL) { (response, status) in
//
//            if let data = response["data"] as? [String:Any]
//            {
//                if let category = data["categories_data"] as? [NSDictionary]{
//
//                    for i in 0..<category.count{
//
//                        if category[i]["type"] as! String == "SAVED" {
//
//                            if let videoData = category[i]["videos"] as? [NSDictionary] {
//
//                                for i in 0..<videoData.count{
//
//                                    do{
//                                    let mainData = try JSONSerialization.data(withJSONObject: videoData[i], options: .prettyPrinted)
//                                        let reqStr = String(data: mainData, encoding: .utf8)
//                                        let strToData = reqStr?.data(using: .utf8)
//                                        let videoItem = try JSONDecoder().decode(WelcomeElement.self, from: strToData!)
//
//                                        let title = videoItem.videoTitle
//                                        let videoImage = videoItem.videoCover
//                                        let desc = videoItem.shortDescription
//
//                                        let addData = saveVideos(title: title!, image: videoImage!, desc: desc!)
//                                        self.saveVideo.append(addData)
//                                    }
//                                    catch{
//                                        print(error)
//                                    }
//                                }
//                            }
//
//                        }
//
//                    }
//
//
//                }
//            }
//
//        }
//
        
    }
    @IBAction func quetions(_ sender: UIButton) {
        imageAnimation(sender: sender)
    }
    @IBAction func bin(_ sender: UIButton) {
        imageAnimation(sender: sender)
    }
    
     @IBAction func share(_ sender: UIButton) {
        imageAnimation(sender: sender)
        tableView.isHidden = false
        let comment = comments.text!
        //commentsArray.append(comment)
        tableView.reloadData()
        let indexPathOfFirstRow = NSIndexPath.init(row: 0, section: 0)
        commentsArray.insert(comment, at: 0)
        print(commentsArray)
        tableView.beginUpdates()
        tableView.insertRows(at: [(indexPathOfFirstRow as IndexPath)], with: .automatic)
        tableView.endUpdates()
        comments.text = ""
        
        DispatchQueue.main.async {
            self.tableViewHieght.constant = CGFloat((self.commentsArray.count) * 150)
            self.tableView.reloadData()
            
//            func updateViewConstraints() {
//                self.tableViewHieght.constant = self.tableView.contentSize.height
//                super.updateViewConstraints()
//                self.tableView.reloadData()
//            }
            
        }
       
     }
    

}
extension SecondHomeViewController: UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as! CommentsTableViewCell
        
        cell.comments(commentsArray[indexPath.row])
        _ = storyboard?.instantiateViewController(identifier: "SignInViewController")
         as! SignInViewController
        
       
        return cell
        
           
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
  
}
extension SecondHomeViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"WatchMoreCollectionViewCell", for: indexPath) as! WatchMoreCollectionViewCell
        
        
        cell.setData(categoryModels[indexPath.row].image, title: categoryModels[indexPath.row].title, desc: categoryModels[indexPath.row].des)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: collectionView.frame.size.width / 2
                      ,height: collectionView.frame.size.height )
    }
    
    
}
extension SecondHomeViewController : UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let aVc = (self.storyboard?.instantiateViewController(identifier: "CommentsViewController")) as! CommentsViewController
        navigationController?.pushViewController(aVc, animated: true)
    }
}
