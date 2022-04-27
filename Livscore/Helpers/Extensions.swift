//
//  Extensions.swift
//  Livscore
//
//  Created by Carlos Cardona on 21/04/22.
//

import Foundation

extension URL {
    
    mutating func addProperty(name: String, value: String?) {
        
        guard var urlComponents = URLComponents(string: absoluteString) else { return }
        
        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []
        
        // Create query item
        let queryItem = URLQueryItem(name: name, value: value)
        
        // Append the new query item in the existing query items array
        queryItems.append(queryItem)
        
        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems
        
        // Return the url with the new components
        self = urlComponents.url!
        
    }
    
}
