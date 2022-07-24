//
//  ReatViewController.swift
//  TableBased
//
//  Created by admin on 21.07.2022.
//

import UIKit

class RateViewController: UIViewController {
    
    @IBOutlet weak var brilliantButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var ratingStackView: UIStackView!
    
    var restRating: String?
    
    @IBAction func rateRestaurant(sender: UIButton){
        switch sender.tag{
        case 0: restRating = "bad"
        case 1: restRating = "good"
        case 2: restRating = "brilliant"
        default: break
        }
        
        performSegue(withIdentifier: "unwindSegueToDvc", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badButton.transform  = CGAffineTransform(scaleX: 0, y: 0)
        goodButton.transform  = CGAffineTransform(scaleX: 0, y: 0)
        brilliantButton.transform  = CGAffineTransform(scaleX: 0, y: 0)
        
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //always fill the view
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.insertSubview(blurEffectView, at: 1)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.4){
//            self.ratingStackView.transform  = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        }
        
        let buttonArray = [badButton, goodButton, brilliantButton]
        for (index, button) in buttonArray.enumerated(){
            UIView.animate(withDuration: 0.3, delay: 0.2  * Double(index), usingSpringWithDamping: 0.5, initialSpringVelocity: 0,  options: .curveEaseInOut, animations: {
                button?.transform = CGAffineTransform(translationX: 1, y: 1)
            }, completion: nil)
        }
    }
    
}
