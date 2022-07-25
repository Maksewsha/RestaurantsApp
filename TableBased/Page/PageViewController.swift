//
//  PageViewController.swift
//  TableBased
//
//  Created by admin on 25.07.2022.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var headerArray = ["Записывайте", "Находите"]
    var subheadersArray = ["Создайте свой список любимых ресторанов", "Найдите и отметьте на карте ваш любимый ресторан"]
    var imagesArray = ["food", "iphoneMap"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstVC = displayViewController(atIndex: 0){
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func displayViewController(atIndex index: Int) -> ContentViewController?{
        guard index >= 0 else {return nil}
        guard index < headerArray.count else {return nil}
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController else { return nil }
        
        contentVC.imageFile = imagesArray[index]
        contentVC.header = headerArray[index]
        contentVC.subheader = subheadersArray[index]
        contentVC.index = index
        
        return contentVC
    }
    
    func nextVC(atIndex index: Int){
        if let vc = displayViewController(atIndex: index + 1){
            setViewControllers([vc], direction: .forward, animated: true)
        }
    }
    
}

extension PageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        return displayViewController(atIndex: index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        return displayViewController(atIndex: index + 1)
    }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return headerArray.count
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController
//        return contentVC.index
//    }
}
