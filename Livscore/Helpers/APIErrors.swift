//
//  APIErrors.swift
//  Livscore
//
//  Created by Carlos Cardona on 28/04/22.
//

import Foundation

enum APIErrors: String, Error {
    case emptyAPIKey = "The key is empty"
}

extension APIErrors: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .emptyAPIKey:
            return "The APIKey is empty, please copy the Key"
        }
    }
    
    var description: String {
        switch self {
        case .emptyAPIKey:
            return "The APIKey is empty, please copy the Key"
        }
    }
}
