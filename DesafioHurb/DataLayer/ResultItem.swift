//
//  Result.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct ResultItem: Codable {
    let sku, id, image, name, url, resultDescription, smallDescription, category: String?
    let isHotel, huFreeCancellation: Bool?
    let amenities: [ResultAmenity]?
    let price: ResultPrice?
    let stars: Int?
    let gallery: [Gallery]?
    let address: Address?
    let tags: [String]?
    let quantityDescriptors: QuantityDescriptors?
    let featuredItem: FeaturedItem?

    enum CodingKeys: String, CodingKey {
        case sku, isHotel, category, smallDescription, amenities, id, price,
            image, name, url, stars, gallery, address, tags, quantityDescriptors, featuredItem
        case huFreeCancellation = "hu_free_cancellation"
        case resultDescription = "description"
    }
}
