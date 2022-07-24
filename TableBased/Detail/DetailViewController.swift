//
//  DetailViewController.swift
//  TableBased
//
//  Created by admin on 20.07.2022.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var restaurant: Restaurant?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapSegue"{
            let dvc = segue.destination as! MapViewController
            dvc.restaurant = self.restaurant
        }
    }
    
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard let srcController = segue.source as? RateViewController else { return }
        guard let rating = srcController.restRating else { return }
        rateButton.setImage(UIImage(named: rating), for: .normal)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableView.automaticDimension
        imageView.image = UIImage(named: restaurant!.image)
//        tableView.backgroundColor = UIColor(ciColor: CIColor.yellow)
//        tableView.separatorColor = UIColor(ciColor: CIColor.red)
        tableView.tableFooterView  = UIView(frame: CGRect.zero)
        title = restaurant!.name
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryTableViewCell
        switch indexPath.row {
        case 0:
            cell.keyField.text = "Название"
            cell.valueField.text = restaurant!.name
        case 1:
            cell.keyField.text = "Тип ресторана"
            cell.valueField.text = restaurant!.type
        case 2:
            cell.keyField.text = "Адрес"
            cell.valueField.text = restaurant!.location
        case 3:
            cell.keyField.text = "Я там был?"
            cell.valueField.text = restaurant!.isVisited ? "Да" : "Нет"
        default:
            break
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}
