//
//  Timezones.swift
//  Livscore
//
//  Created by Carlos Cardona on 22/04/22.
//

import Foundation

struct Timezone: Codable {
    var timezones: [String]
    
    enum CodingKeys: String, CodingKey {
        case timezones = "response"
    }
}
