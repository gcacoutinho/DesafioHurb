//
//  PriceElement.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct PriceElement: Codable {
    let min, maxExclusive, count: Int
    let filter: String
}
