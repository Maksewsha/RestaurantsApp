//
//  ContentViewController.swift
//  TableBased
//
//  Created by admin on 25.07.2022.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var pageButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subheaderLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    var header = ""
    var subheader = ""
    var imageFile = ""
    var index = 0
    
    @IBAction func pageButtonPressed(_ sender: UIButton) {
        switch index{
        case 0:
            let pageVC = parent as! PageViewController
            pageVC.nextVC(atIndex: index)
        case 1:
            let userDefaults = UserDefaults.standard
            userDefaults.setValue(true, forKey: "wasIntroWatched")
            userDefaults.synchronize()
            dismiss(animated: true, completion: nil)
        default: break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        pageButton.layer.cornerRadius = 15
        pageButton.clipsToBounds = true
        pageButton.layer.borderWidth = 2
        pageButton.layer.borderColor = CGColor(red: 150, green: 120, blue: 55, alpha: 100)
        
        switch index {
        case 0: pageButton.setTitle("Далее", for: .normal)
        case 1: pageButton.setTitle("Открыть", for: .normal)
        default: break
        }
        
        headerLabel.text = header
        subheaderLabel.text = subheader
        imageView.image = UIImage(named: imageFile)
        pageControl.numberOfPages = 2
        pageControl.currentPage = index
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
