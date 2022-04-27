//
//  Countries.swift
//  Livscore
//
//  Created by Carlos Cardona on 22/04/22.
//

import Foundation

struct CountriesBody: Codable {
    var response: [Country]
}

struct Country: Codable {
    var code: String?
    var flag: String?
    var name: String
}

