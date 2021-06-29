//
//  SearchViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 05/05/21.
//

import UIKit

class SearchViewController: UIViewController,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource, UISearchResultsUpdating   {
 
    
  
    
  
   
    @IBOutlet var serachBarText: UISearchBar!
    
    @IBOutlet var collectionView: UICollectionView!
    
    let search = UISearchController()
    
   
    var filterData : String?
    @IBOutlet var tabBar: UITabBarItem!
    var searching = false
    var videosTitle = [addVideos]()
    var searchingResults = [addVideos]()
    var videoData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        initSearchResults()
        
        
        commenWs.getURL(url: VIDEOSAPI) { (response, status) in
            
            if status {
                if let data = response["data"] as? [String:Any] {
                    if let category_data = data["videos"] as? [NSDictionary]{
                        for i in 0..<category_data.count {
                            if let videoData = category_data[i] as? [String:Any] {
                                do{
                                    let json = try JSONSerialization.data(withJSONObject: videoData, options: .prettyPrinted)
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
   
        collectionView.register(UINib(nibName: "WatchMoreCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "WatchMoreCollectionViewCell")
  
    
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    func initSearchResults() {

        search.loadViewIfNeeded()
        search.searchBar.enablesReturnKeyAutomatically = false
        search.searchBar.returnKeyType = UIReturnKeyType.done
        search.searchResultsUpdater = self
        search.searchBar.delegate = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search"
        navigationItem.searchController = search
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if searching {
            
            return searchingResults.count
            
        }
        else {
            return videosTitle.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchMoreCollectionViewCell", for: indexPath) as! WatchMoreCollectionViewCell
       
        if searching {
            
            cell.setData(searchingResults[indexPath.row].image, title: searchingResults[indexPath.row].title, desc: searchingResults[indexPath.row].des)
        }
        
        else {
            cell.setData(videosTitle[indexPath.row].image, title: videosTitle[indexPath.row].title, desc: videosTitle[indexPath.row].des)
        }
        
       
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 2
                      ,height: collectionView.frame.size.height )
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchingResults.removeAll()
        collectionView.reloadData()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        DispatchQueue.main.async {
            let searchText = self.search.searchBar.text
            
            if !searchText!.isEmpty{
                
                self.searching = true
                self.searchingResults.removeAll()
                
                for videos in self.videosTitle {
                    
                    if videos.title.lowercased().contains((searchText?.lowercased())!){
                        
                        self.searchingResults.append(videos)
                    }
                }
            }
            
            else{
                
                self.searching = false
                self.searchingResults.removeAll()
                self.searchingResults = self.videosTitle
            }
         
            self.collectionView.reloadData()
        }
        
   
    }
    

}







//    func filterForSearchTextScopesButton(searchText : String)  {
//
//        if serachBarText.text != "" {
//
//            filterData = data.filter{$0.contains(serachBarText.text!)}
//            tableView.reloadData()
//        }
//        else {
//            print("enter valid text")
//
//            filterData = data
//            tableView.reloadData()
//        }
//    }

//

//    func updateSearchResults(for searchController: UISearchController) {
//
//        let searchBar = search.searchBar
//        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
//        let searchText = searchBar.text
//
//        filterForSearchTextScopesButton(searchText : searchText! )
//    }
//let nib = UINib(nibName: "tableCell", bundle: nil)
  //  tableView.register(nib, forCellReuseIdentifier: "tableCell")

   //var resultsTableController =
      //  self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController

// resultsTableController?.tableView.delegate = self
