//
//  GuestModel.swift
//  Where2Go
//
//  Created by Kiran on 02/09/23.
//

import UIKit

class GuestModel {

    let countryName: String
    let persons: [PersonName]
    var iscollapseOrNot: Bool
    
    init(countryName: String, persons: [PersonName], iscollapseOrNot: Bool) {
        self.countryName = countryName
        self.persons = persons
        self.iscollapseOrNot = iscollapseOrNot
    }
}

class PersonName{
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
