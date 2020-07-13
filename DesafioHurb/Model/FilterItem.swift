//
//  FilterItem.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct FilterItem: Codable {
    let term, filter: String
    let count: Int
}
