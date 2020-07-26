//
//  Tax.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct Tax: Codable {
    let type, currency, currencyOriginal, name: String?
    let amount, amountOriginal: Double?
    
    enum CodingKeys: String, CodingKey {
        case type, name, amount, currency
        case amountOriginal = "amount_original"
        case currencyOriginal = "currency_original"
    }
}
