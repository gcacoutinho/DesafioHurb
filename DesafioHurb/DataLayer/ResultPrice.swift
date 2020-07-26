//
//  ResultPrice.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct ResultPrice: Codable {
    let amount, oldPrice, currentPrice, totalPrice, originalAmountPerDay, amountPerDay: Double?
    let currency, currencyOriginal, sku: String?
    let gain, feeExtraOriginal, gainOriginal, feeExtra: Int?
    let tariffPolicies: [JSONAny]?
    let taxes: [Tax]?

    enum CodingKeys: String, CodingKey {
        case amount, currency, gain, sku, taxes, originalAmountPerDay, amountPerDay
        case oldPrice = "old_price"
        case currencyOriginal = "currency_original"
        case feeExtraOriginal = "fee_extra_original"
        case gainOriginal = "gain_original"
        case tariffPolicies = "tariff_policies"
        case currentPrice = "current_price"
        case totalPrice = "total_price"
        case feeExtra = "fee_extra"
    }
}
