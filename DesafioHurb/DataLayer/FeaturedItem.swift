//
//  FeaturedItem.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct FeaturedItem: Codable {
    let amenities: [String]?
    let name, image, featuredItemDescription, bedType, meal: String?
    let hasInternet: Bool?

    enum CodingKeys: String, CodingKey {
        case amenities, name, image, bedType, meal, hasInternet
        case featuredItemDescription = "description"
    }
}
