//
//  Tax.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct Tax: Codable {
    let type: TypeEnum
    let name: Name
    let amount, amountOriginal: Double
    let currency, currencyOriginal: Currency

    enum CodingKeys: String, CodingKey {
        case type, name, amount
        case amountOriginal = "amount_original"
        case currency
        case currencyOriginal = "currency_original"
    }
}
