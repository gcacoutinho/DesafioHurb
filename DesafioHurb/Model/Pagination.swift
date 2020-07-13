//
//  Pagination.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct Pagination: Codable {
    let count: Int
    let firstPage, nextPage, lastPage: String
    let previousPage: JSONNull?
}
