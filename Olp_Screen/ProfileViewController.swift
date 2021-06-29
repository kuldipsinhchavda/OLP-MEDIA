//
//  ProfileViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 29/04/21.
//

import UIKit

var homeView = SecondHomeViewController()
class ProfileViewController: UIViewController {
   
    @IBOutlet var bioView: UIView!
    var bio : String?
    var userData1 = [userDetails]()
    var profileImage = [profilePhoto]()
    var videosTitle = [addVideos]()
    
    var dateof : String?
    @IBOutlet var fullName: UILabel!
    @IBOutlet var setting: UIButton!
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var bioLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var userId = [String:Any]()
        userId["user_id"] = UserDefaults.userId
        commenWs.GETURL(url: USERDETAILS_URL, dict: userId) { (response, status) in
            
            if status{
                
               if let data = response["data"] as? [String:Any]{
                
                if let userData = data["user"] as? [String:Any]{
                    
                    do{
                    
                        let jsonData = try JSONSerialization.data(withJSONObject: userData, options: .prettyPrinted)
                        let reqStr = String(data: jsonData, encoding: .utf8)
                        let strToData = reqStr?.data(using: .utf8)
                        let data1 = try JSONDecoder().decode(User.self, from: strToData!)
                        let emainId = data1.email
                        let fullName = data1.fullName
                        let date = data1.createdAt
                        let userBio = data1.bio
                     
                        DispatchQueue.main.async {
                            let addData = userDetails(email: emainId!, fullName: fullName!, date: date! ,  bio: userBio ?? "good morning")
                            self.userData1.append(addData)
                            self.funcData(with: self.userData1[0])
                        }
                 
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                    
                    if let userPic = userData["profile_pic"] as? [String:Any] {
                        
                        do{
                        
                            let jsonData = try JSONSerialization.data(withJSONObject: userPic, options: .prettyPrinted)
                            let reqStr = String(data: jsonData, encoding: .utf8)
                            let strToData = reqStr?.data(using: .utf8)
                            let profileData = try JSONDecoder().decode(UserProfilePic.self, from: strToData!)
                            let userProfile = profileData.url
                            let url = URL(string:userProfile ?? "profile")
                            if let data = try? Data(contentsOf: url!)
                               {
                                let image: UIImage = UIImage(data: data)!
                                let addData = profilePhoto(image: image)
                            
                                self.profileImage.append(addData)
                                self.profile(with: self.profileImage[0])
                               }
                   
                        }
                        catch{
                            print(error.localizedDescription)
                        }
                    }

               }
              else {
                    print("mismatch")
                }
                
               }
                
            }
            
        }
        
        commenWs.getURL(url: CATEGORY_URL) { (response, status) in
            
            if status {
                
                if let data = response["data"] as? [String:Any] {
                    
                    if let category_data = data["categories_data"] as? [NSDictionary]{
                        
                        for i in 0..<category_data.count {
                            
                            if category_data[i]["type"] as! String == "Saved" {
                                
                                if let videoData = category_data[i]["videos"] as? [NSDictionary] {
                                    for j in 0..<videoData.count{
                                do{
                                    let json = try JSONSerialization.data(withJSONObject: videoData[j], options: .prettyPrinted)
                                    let reqStr = String(data: json, encoding: .utf8)
                                    let strToData = reqStr?.data(using: .utf8)
                                    let saveVideos = try JSONDecoder().decode(WelcomeElement.self, from: strToData!)
                                    let photo = saveVideos.videoCover
                                    let desc = saveVideos.shortDescription
                                    let title = saveVideos.videoTitle
                                    
                                    DispatchQueue.main.async {
                                        let addData = addVideos(title: title ?? "ergw", image: photo ?? "6" , desc: desc ?? "hii")
                                        self.videosTitle.append(addData)
                                        
                                        self.collectionView.reloadData()
                                    }
                                }
                                catch{
                                    
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                }
            }
            
        }
        
        profilePic.layer.borderWidth=1.0
        profilePic.layer.borderColor = UIColor.white.cgColor
        profilePic.layer.cornerRadius = profilePic.frame.height / 2
        profilePic.clipsToBounds = true
        setting.layer.cornerRadius = 5
        setting.layer.borderWidth = 2
        setting.layer.borderColor = UIColor.black.cgColor
        
        collectionView.register(UINib(nibName: "SaveVideosCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "SaveVideosCollectionViewCell")
        let tabGesture = UITapGestureRecognizer()
        bioView.addGestureRecognizer(tabGesture)
        tabGesture.addTarget(self, action: #selector(Addclick))
     
    }
    @objc func Addclick(){
        let aVc = storyboard?.instantiateViewController(identifier: "EditBioViewController") as! EditBioViewController
        aVc.userName = fullName.text
        
        aVc.newBio = bioLbl.text
        aVc.image = profilePic.image
        navigationController?.pushViewController(aVc, animated: true)
    }
   

    func funcData(with model : userDetails)  {
 
        fullName.text = model.fullName
        bioLbl.text = model.bio
    }
    
    func profile(with model:profilePhoto){
        
        profilePic.image = model.image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
 
    @IBAction func setting(_ sender: UIButton) {
        
        let aVc = storyboard?.instantiateViewController(identifier: "FullProfileViewController") as! FullProfileViewController
        
        aVc.image = profilePic.image
        navigationController?.pushViewController(aVc, animated: true)
    }
}

extension ProfileViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videosTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SaveVideosCollectionViewCell", for: indexPath) as! SaveVideosCollectionViewCell
       // cell.confige(with: videosTitle[indexPath.row])
        cell.setData(videosTitle[indexPath.row].image , title: videosTitle[indexPath.row].title, desc: videosTitle[indexPath.row].des)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2
                      ,height: collectionView.frame.size.height )
    }
}


