//
//  Filters.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct Filters: Codable {
    let amenities, states, attributes, countries, cities, departureCities,
        duration, food, people, productType, regulation, rooms, stars: [FilterItem]?
    let prices: [PriceElement]?
    let priceInterval: PriceInterval?
}
