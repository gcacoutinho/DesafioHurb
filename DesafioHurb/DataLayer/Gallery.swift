//
//  Gallery.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct Gallery: Codable {
    let galleryDescription, url, roomID: String?

    enum CodingKeys: String, CodingKey {
        case galleryDescription = "description"
        case url
        case roomID = "room_id"
    }
}
