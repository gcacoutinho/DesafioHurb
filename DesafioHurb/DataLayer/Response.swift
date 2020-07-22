//
//  Response.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct Response: Codable {
    let meta: Meta?
    let filters: Filters?
    let results: [ResultItem]?
    let pagination: Pagination?
}
