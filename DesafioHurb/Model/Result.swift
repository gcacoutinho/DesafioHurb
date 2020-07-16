//
//  Result.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct Result: Codable {
    let sku, id, smallDescription, image, name, url, resultDescription: String?
    let isHotel: Bool?
    let category: String?
    let amenities: [ResultAmenity]?
    let price: ResultPrice?
    let huFreeCancellation: Bool?
    let stars: Int?
    let gallery: [Gallery]?
    let address: Address?
    let tags: [String]?
    let quantityDescriptors: QuantityDescriptors?
    let featuredItem: FeaturedItem?

    enum CodingKeys: String, CodingKey {
        case sku, isHotel, category, smallDescription, amenities, id, price
        case huFreeCancellation = "hu_free_cancellation"
        case image, name, url
        case resultDescription = "description"
        case stars, gallery, address, tags, quantityDescriptors, featuredItem
    }
}
