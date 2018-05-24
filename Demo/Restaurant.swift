//
//  Restaurant.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/24.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - Restaurant

import CoreLocation

class Restaurant: NSObject {
    
    let name: String
    
    let cuisine: Cuisine
    
    let introduction: String
    
    let coordinate: CLLocationCoordinate2D
    
    init(
        name: String,
        cuisine: Cuisine,
        introduction: String,
        coordinate: CLLocationCoordinate2D
    ) {
        
        self.name = name
        
        self.cuisine = cuisine
        
        self.introduction = introduction
        
        self.coordinate = coordinate
        
    }
    
}
