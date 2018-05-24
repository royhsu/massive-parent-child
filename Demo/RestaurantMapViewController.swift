//
//  RestaurantMapViewController.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/24.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - RestaurantMapViewController

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController {
    
    @IBOutlet
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mapView.delegate = self
        
    }
    
}

extension RestaurantMapViewController {
    
    func addRestaurant(
        _ restaurant: Restaurant,
        animated: Bool
    ) {
        
        mapView.addAnnotation(restaurant)
        
        mapView.setCenter(
            restaurant.coordinate,
            animated: animated
        )
        
    }
    
}

// MARK: MKMapViewDelegate

extension RestaurantMapViewController: MKMapViewDelegate {
    
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    )
    -> MKAnnotationView? {
        
        return MKPinAnnotationView(
            annotation: annotation,
            reuseIdentifier: nil
        )
            
    }
    
}
