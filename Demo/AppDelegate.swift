//
//  AppDelegate.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/24.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - AppDelegate

import CoreLocation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    )
    -> Bool {
        
        let storyboard = UIStoryboard(
            name: "Main",
            bundle: nil
        )
        
        let restaurantViewController = storyboard.instantiateViewController(withIdentifier: "RestaurantViewController") as! RestaurantViewController
        
        restaurantViewController.restaurant = Restaurant(
            name: "鼎泰豐",
            cuisine: .taiwanese,
            introduction: "鼎泰豐是臺灣一家以麵食產銷為主的連鎖餐廳，以小籠包聞名。目前在港澳、日本、新加坡、韓國、印尼、馬來西亞、中國大陸、美國、澳大利亞、泰國、杜拜、菲律賓、法國設有分店。 1958年開設於臺北市信義路，最初爲流行而於1970年代起兼賣小籠包，從此發跡。",
            coordinate: CLLocationCoordinate2D(
                latitude: 25.0333396,
                longitude: 121.5621184
            )
        )
        
        window.rootViewController = UINavigationController(rootViewController: restaurantViewController)
        
        window.makeKeyAndVisible()
        
        return true
            
    }
    
}
