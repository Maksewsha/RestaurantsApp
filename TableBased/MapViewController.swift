//
//  MapViewController.swift
//  TableBased
//
//  Created by admin on 24.07.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var restaurant: Restaurant!

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location){ (placeMarks, error) in
            guard error == nil else { return }
            guard let placeMarks = placeMarks else { return }
            
            let placeMark = placeMarks.first!
            
            let annotation = MKPointAnnotation()
            annotation.title = self.restaurant.name
            annotation.subtitle = self.restaurant.type
            guard let location = placeMark.location else { return }
            
            annotation.coordinate = location.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
        }

        // Do any additional setup after loading the view.
    }
    
    


}
