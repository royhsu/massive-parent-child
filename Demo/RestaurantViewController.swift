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

class RestaurantViewController: UIViewController {

    @IBOutlet
    weak var nameLabel: UILabel!
    
    @IBOutlet
    weak var cuisineLabel: UILabel!
    
    @IBOutlet
    weak var introductionLabel: UILabel!
    
    @IBOutlet
    weak var mapContainerView: UIView!
    
    // The child map view controller.
    lazy var mapViewController: RestaurantMapViewController = {
        
        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )
      
        let viewController = storyboard.instantiateViewController(withIdentifier: "RestaurantMapViewController") as! RestaurantMapViewController
        
        return viewController
        
    }()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        setUpMapViewController()
        
        guard
            let restaurant = restaurant
        else { return }
        
        mapViewController.addRestaurant(
            restaurant,
            animated: true
        )
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        tearDownMapViewController()
        
    }
    
    // Set up the map view controller as child.
    func setUpMapViewController() {
        
        let mapContentView = mapViewController.view!
        
        addChildViewController(mapViewController)
        
        mapContainerView.addSubview(mapContentView)
        
        mapContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                mapContentView.topAnchor.constraint(equalTo: mapContainerView.topAnchor),
                mapContentView.leadingAnchor.constraint(equalTo: mapContainerView.leadingAnchor),
                mapContentView.bottomAnchor.constraint(equalTo: mapContainerView.bottomAnchor),
                mapContentView.trailingAnchor.constraint(equalTo: mapContainerView.trailingAnchor)
            ]
        )
        
        mapViewController.didMove(toParentViewController: self)
        
    }
    
    // Tear down the child map view controller.
    func tearDownMapViewController() {
        
        mapViewController.willMove(toParentViewController: nil)
        
        let mapContentView = mapViewController.view!
        
        mapContentView.removeFromSuperview()
        
        mapViewController.removeFromParentViewController()
        
    }
    
}
