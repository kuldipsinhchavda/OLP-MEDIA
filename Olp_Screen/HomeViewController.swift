//
//  HomeViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 05/05/21.
//

import UIKit
import MBProgressHUD
import Alamofire

struct MainModel {
    
    var mainTitle : String?
    var item = [categoryModel]()
    var type : String?
    
    init(mainTitle : String, item : [categoryModel], type : String ) {
        self.mainTitle = mainTitle
        self.item = item
        self.type = type
    }
}
class HomeViewController: UIViewController {

    var categoryModels = [categoryModel]()
    var mainModels = [mainModel]()
    var itemModel = [MainModel]()
    var videoDetails = [MainVideo]()
    var advertisMent : advertiseCoder?
    var categoriesArray = [MainCategoriesDatum]()
    
    //var adverticeMent : Adverticement?
    var cellClicked : ((Int) -> Void)?
    let titleArray = ["Backside Medball movements","Backside Medball movements","Backside Medball movements","Backside Medball movements","Backside Medball movements","Backside Medball movements","Backside Medball movements"]
    var header = ["STRENGTH","EXPLOSION","CORE"]
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: .main), forCellReuseIdentifier: "HomeTableViewCell")
        
        tableView.register(UINib(nibName: "MainCatogeryTableViewCell", bundle: .main), forCellReuseIdentifier: "MainCatogeryTableViewCell")
        
        
        tableView.register(UINib(nibName: "AdvertiesmentTableViewCell", bundle: .main), forCellReuseIdentifier: "AdvertiesmentTableViewCell")
        SingleTon.showHud(vc:self)
        commenWs.getURL(url: CATEGORY_URL) { (response, status) in
            
        
            SingleTon.hideHud(vc: self)
            
            if status{
            if let data = response["data"] as? [String:Any]
            {
                if let categoryData = data["categories_data"] as? [NSDictionary]{
                    
                    for i in 0..<categoryData.count{
                    
                    var name : String?
                    
                    do {
                        let data = try JSONSerialization.data(withJSONObject: categoryData[i], options: .prettyPrinted)
                        let reqStr = String(data: data, encoding: .utf8)
                        let strToData = reqStr?.data(using: .utf8)
                        let userData = try JSONDecoder().decode(MainCategoriesDatum.self, from: strToData!)
                        name = userData.name ?? ""
                      
                    }
                    catch
                        
                    {
                        print(error)
                    }
                        
                        if name != "" {
                            
                            
                           if let video_items = categoryData[i]["videos"] as? [NSDictionary]
                           {
                            for videos in video_items{
                                
                            do{
                                let data = try JSONSerialization.data(withJSONObject: videos, options: .prettyPrinted)
                                let reqStr = String(data: data, encoding: .utf8)
                                let strToData = reqStr?.data(using: .utf8)
                                let videosData = try JSONDecoder().decode(VideoModel.self, from: strToData!)
                                UserDefaults.categoryId = videosData.categoryId
                                let title = videosData.videoTitle
                                let mainImage = videosData.videoCover
                                let desc = videosData.shortDescription
                               let categoryId = videosData.categoryId
                                
                               
                                let addData = categoryModel(title: title ?? "" , image: mainImage ?? "", desc: desc ?? "",categoryId : categoryId ?? 55)
                                
                                self.categoryModels.append(addData)
                                
                                
                            }
                                catch{
                                    print(error.localizedDescription)
                                }
                            }
                            
                            let mainDataAdd = MainModel(mainTitle: name!, item: self.categoryModels, type: "")
                            self.itemModel.append(mainDataAdd)
                            }
                           
                            DispatchQueue.main.async {
                               // UserDefaults.categoryId = videosData.categoryId
                                self.tableView.reloadData()
                           }
                           
                        }
                        
                        else if categoryData[i]["type"] as! String == "Advertisement"{
                            
                        do{
                            
                            let data = try JSONSerialization.data(withJSONObject: categoryData[i], options: .prettyPrinted)
                            let reqStr = String(data: data, encoding: .utf8)
                            let strToData = reqStr?.data(using: .utf8)
                            let userData = try JSONDecoder().decode(AdvertiseCoder.self, from:strToData!)
                            let url = userData.externalUrl
                            let image = userData.image
                            let desc = userData.descriptionField
                            let toipc = userData.topicName
                            
                            self.advertisMent = advertiseCoder(topicName: toipc! , externalUrl: url!, image: image!, desc: desc!)
                            
                            
                            let s = MainModel(mainTitle: "", item: self.categoryModels, type: "Advertisement")
                            
                            self.itemModel.append(s)
                                
                        }
                            catch {
                                
                                print(error.localizedDescription)
                            }
                        }
                        
                        else if categoryData[i]["type"] as! String == "Main Category"
                        {
                            if let videoData = categoryData[i]["videos"] as? [NSDictionary] {
                                
                                for i in 0..<videoData.count{
                                    
                                    do{
                                    let mainData = try JSONSerialization.data(withJSONObject: videoData[i], options: .prettyPrinted)
                                        let reqStr = String(data: mainData, encoding: .utf8)
                                        let strToData = reqStr?.data(using: .utf8)
                                        let videoItem = try JSONDecoder().decode(MainVideo.self, from: strToData!)
                                        let date = videoItem.createdAt
                                        let title = videoItem.videoTitle
                                        let videoImage = videoItem.videoCover
                                        let series = videoItem.videoSeries
                                        
                                        let addData = mainModel(title: title!, image: videoImage!, series: series!, createdAt: date!)
                                        self.mainModels.append(addData)
                                    }
                                    catch{}
                                    
                                }
                                
                                DispatchQueue.main.async {
                                    
                                    let mainDataAdd = MainModel(mainTitle: "", item: self.categoryModels, type: "Main Category")
                                    self.itemModel.append(mainDataAdd)
                                    self.tableView.reloadData()
                               }
                               
                            }
                        }
                       
                    }
                }
            }
            }
            else{
                let alert = UIAlertController(title: response["type"] as? String, message: response["message"] as? String, preferredStyle: .alert)
                let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    let aVc = self.storyboard?.instantiateViewController(identifier: "JoinViewController") as! JoinViewController
                   
                    self.navigationController?.pushViewController(aVc, animated: true)
                   
                }
                alert.addAction(saveAction)
                self.present(alert, animated: true, completion: nil)
                if let message = response["message"] as? String , message.count > 0 {
                    print(message)
            }
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
        public func second(index: Int) {
            let aVc = self.storyboard?.instantiateViewController(identifier: "SecondHomeViewController") as! SecondHomeViewController
//      let uItem = self.models[indexPath.section].item
        aVc.titlePhoto = self.categoryModels[index].image
        aVc.titleDesc = self.categoryModels[index].des
            aVc.categoryId = self.categoryModels[index].categoryId
        aVc.titleLable1 = self.categoryModels[index].title
    
        self.navigationController?.pushViewController(aVc, animated: true)
    }
   
}
extension HomeViewController:UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        print(itemModel.count)
        return itemModel.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainCatogeryTableViewCell", for: indexPath) as! MainCatogeryTableViewCell
            
            cell.cellClicked = { index in
                
                self.second(index: index)
                }
      
            cell.categoryModels = itemModel[indexPath.section].item
            return cell
        }
       else if indexPath.section == 1 {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainCatogeryTableViewCell", for: indexPath) as! MainCatogeryTableViewCell
        
        cell.cellClicked = { index in
            
            self.second(index: index)
            
        }
        cell.categoryModels = itemModel[indexPath.section].item
            return cell
        }
       else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainCatogeryTableViewCell", for: indexPath) as! MainCatogeryTableViewCell
            
        cell.cellClicked = { index in
            
            self.second(index: index)
            
        }
        cell.categoryModels = itemModel[indexPath.section].item
            return cell
        }
       else if indexPath.section == 3 {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertiesmentTableViewCell", for: indexPath) as! AdvertiesmentTableViewCell
        
        cell.setData(model: advertisMent!)
        //cell.config(with: mainModels)
        return cell
       
        }
      
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            
            cell.models = mainModels
            
           
            return cell
              
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < header.count {
            return header[section]
        }

        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        // can change the header color of background and title with this code :)

        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.white.withAlphaComponent(1)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.black
       // (view as! UITableViewHeaderFooterView).
        }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let viewHeder = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
//        let viewHeder1 = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
//        viewHeder.backgroundColor = .white
//        viewHeder1.backgroundColor = .white
//
//        let lblHeader = UILabel(frame: CGRect(x: 10, y: 20, width: viewHeder.bounds.width, height: 30))
//        if  UIDevice.current.userInterfaceIdiom == .pad {
//             lblHeader.font =  UIFont.boldSystemFont(ofSize: 30)
//        } else {
//            lblHeader.font =  UIFont.boldSystemFont(ofSize: 22)
//        }
//
//
//        if section == 0
//        {
//            lblHeader.textColor = .black
//            lblHeader.text = "CORE".uppercased()
//            viewHeder.addSubview(lblHeader)
//            return viewHeder
//        }
//        else
//        {
//            lblHeader.textColor = .black
//            lblHeader.text = "exercise".uppercased()
//            viewHeder1.addSubview(lblHeader)
//            return viewHeder1
//        }
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 3 {

            let urlString = advertisMent?.ExternalUrl

            if let url = NSURL(string: urlString ?? "https://www.google.com/?client=safari") {

                UIApplication.shared.openURL(url as URL)
            }
    }
            
        }
        
        //cellClicked!(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
 
