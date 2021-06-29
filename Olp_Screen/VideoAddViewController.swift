//
//  VideoAddViewController.swift
//  Olp_Screen
//
//  Created by Bharat Kakadiya on 07/06/21.
//

import UIKit
import AVKit
import AVFoundation

class VideoAddViewController: UIViewController, AVPlayerViewControllerDelegate {
    @IBOutlet var thumbImage: UIImageView!
//    var player: AVPlayer?
//    let videoUrl = "https://www.dropbox.com/s/0x2ke57h7wv49ll/Sample_512x288.mp4"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = thumbImage.image, let cgimg = image.cgImage else {
            return
        }
        let coreImage = CIImage(cgImage: cgimg)
            
            let filter = CIFilter(name: "CIZoomBlur")
            filter?.setValue(coreImage, forKey: kCIInputImageKey)
            filter?.setValue(0.5, forKey: kCIInputIntensityKey)
            
        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage {
            let filteredImage = UIImage(ciImage: output)
                thumbImage?.image = filteredImage
            }
                
            else {
                print("image filtering failed")
            }
       
    }
    
//    func getthumbNailFromImage(url : URL,completion : @escaping((_ Image : UIImage) -> Void)){
//        DispatchQueue.global().async {
//            let asset = AVAsset(url: url)
//            let assetImageGen = AVAssetImageGenerator(asset: asset)
//            assetImageGen.appliesPreferredTrackTransform = true
//
//            let thumbnailTime = CMTimeMake(value: 7, timescale: 1)
//            do{
//                let cgThumbImage = try assetImageGen.copyCGImage(at: thumbnailTime, actualTime: nil)
//                let thumbImage = UIImage(cgImage: cgThumbImage)
//
//                DispatchQueue.main.async {
//                    completion(thumbImage)
//                }
//            }
//            catch{
//
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//
//let url = URL(string: videoUrl)
//
//self.getthumbNailFromImage(url: url!) { (thumbImage) in
//
//    self.thumbImage.image = thumbImage
//
//
//
//}
//guard let url = URL(string: "https://www.dropbox.com/s/0x2ke57h7wv49ll/Sample_512x288.mp4zbdf") else {
//                   print("Umm, looks like an invalid URL!")
//                   return
//               }
//
//               player = AVPlayer(url: url)
//               let controller = AVPlayerViewController()
//               controller.delegate = self
//               controller.player = player
//
//               // present the player controller & play
//               present(controller, animated: true) {
//                   self.player?.play()
//               }
