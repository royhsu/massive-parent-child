//
//  Cuisine.swift
//  Demo
//
//  Created by Roy Hsu on 2018/5/24.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - Cuisine

enum Cuisine {
    
    case american
    
    case italian
    
    case japanese
    
    case taiwanese
    
}

// MARK: - CustomStringConvertible

extension Cuisine: CustomStringConvertible {
    
    var description: String {
        
        switch self {
            
        case .american: return "American Cuisine"
            
        case .italian: return "Italian Cuisine"
            
        case .japanese: return "Japanese Cuisine"
            
        case .taiwanese: return "Taiwanese Cuisine"
            
        }
        
    }
    
}
