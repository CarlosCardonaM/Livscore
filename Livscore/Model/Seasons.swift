//
//  Seasons.swift
//  Livscore
//
//  Created by Carlos Cardona on 22/04/22.
//

import Foundation

struct SeasonsBody: Codable {
    var seasons: [Int]
    
    enum CodingKeys: String, CodingKey {
        case seasons = "response"
    }
}
