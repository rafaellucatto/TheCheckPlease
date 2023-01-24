//
//  Item.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation

struct Item: Codable, Equatable {
    var price: Double
    var checked: Bool
}

enum Items: String {
    case saveAndLoad = "saveAndLoadItems"
}
