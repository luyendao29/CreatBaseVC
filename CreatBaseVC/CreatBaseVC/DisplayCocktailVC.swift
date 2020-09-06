//
//  DisplayCocktailVC.swift
//  CreatBaseVC
//
//  Created by Boss on 9/6/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class DisplayCocktailVC: UIViewController {
    @IBOutlet weak var cocktailImageView1: UIImageView!
    @IBOutlet weak var cocktailImageView2: UIImageView!
    @IBOutlet weak var cocktailImageView3: UIImageView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    var linkString: String?
    
    var displayRandom = 0
    
    var listLink = ["https://upload.wikimedia.org/wikipedia/commons/c/cc/ESC_large_ISS022_ISS022-E-11387-edit_01.JPG", "https://upload.wikimedia.org/wikipedia/commons/e/e3/Large_and_small_magellanic_cloud_from_new_zealand.jpg", "https://upload.wikimedia.org/wikipedia/commons/e/e0/Large_Scaled_Forest_Lizard.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageView()
        
    }
    
    func loadImageView() {
        indicatorView.startAnimating()
        for link in listLink {
            DispatchQueue.global().async {
                print(link)
                // load anh
                guard let url = URL(string: link) else {return}
                guard let data = try? Data(contentsOf: url) else {return}
                DispatchQueue.main.async {
                    self.displayRandom += 1
                    switch self.displayRandom {
                    case 1:
                        self.cocktailImageView1.image = UIImage(data: data)
                    case 2:
                        self.cocktailImageView2.image = UIImage(data: data)
                    default:
                        self.cocktailImageView3.image = UIImage(data: data)
                    }
                    self.indicatorView.stopAnimating()
                }
            }
                    
        if let linkString = linkString {
            if linkString == "" {
                
            }
            print(linkString)
            
//                        if let cocktailImageView = self.cocktailImageView {
//                            cocktailImageView.image = UIImage(data: data)
////                            cocktailImageView.alpha = 0.3
////                            UIView.animate(withDuration: 0.35, animations: {
////                                cocktailImageView.alpha = 1
////                            })
//                            self.indicatorView.stopAnimating()
//                        }
                        
                        
                    
            }
//            DispatchQueue.global().async {
//                // load anh
//                guard let url = URL(string: linkString) else {return}
//                guard let data = try? Data(contentsOf: url) else {return}
//                DispatchQueue.main.async {
//                    self.cocktailImageView.image = UIImage(data: data)
//                    self.cocktailImageView.alpha = 0.3
//                    UIView.animate(withDuration: 0.35, animations: {
//                        self.cocktailImageView.alpha = 1
//                    })
//                    self.indicatorView.stopAnimating()
//                }
//            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
