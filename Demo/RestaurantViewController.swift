//
//  RestaurantViewController.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/24.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - RestaurantViewController

import MapKit
import UIKit

class RestaurantViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet
    weak var nameLabel: UILabel!
    
    @IBOutlet
    weak var cuisineLabel: UILabel!
    
    @IBOutlet
    weak var introductionLabel: UILabel!
    
    @IBOutlet
    weak var mapView: MKMapView!
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        guard
            let restaurant = restaurant
        else { return }
        
        nameLabel.text = restaurant.name
        
        cuisineLabel.text = restaurant.cuisine.description
        
        introductionLabel.text = restaurant.introduction
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        guard
            let restaurant = restaurant
        else { return }
        
        mapView.delegate = self
        
        mapView.addAnnotation(restaurant)
        
        mapView.setCenter(
            restaurant.coordinate,
            animated: true
        )
        
    }
    
    // MARK: MKMapViewDelegate
    
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
