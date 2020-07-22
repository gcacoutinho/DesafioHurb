//
//  Meta.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct Meta: Codable {
    let count, offset, countWithAvailability, countWithAvailabilityInPage, countHotel,
        countPackage, countTicket, countBustrip, countDisney: Int?
    let query, warning: String?
}
