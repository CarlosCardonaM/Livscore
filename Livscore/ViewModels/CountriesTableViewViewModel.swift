//
//  CountriesTableViewViewModel.swift
//  Livscore
//
//  Created by Carlos Cardona on 28/04/22.
//

import Foundation

class CountriesTableViewViewModel {

    var countryName: String
    var countrFlag: String
    
    init(countryName: String, countryFlag: String) {
        self.countryName = countryName
        self.countrFlag = countryFlag
    }
}
