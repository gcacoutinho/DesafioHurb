//
//  Address.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

struct Address: Codable {
    let zipcode, addressFullAddress, street, addressStreetName,
        streetName, address, fullAddress: String
    let neighborhood: String?
    let idAtlasNeighborhood, idNeighborhood, idAtlasCity,
        idAtlasCountry, idAtlasState: JSONNull?
    let city: City
    let idCity, idState, idCountry: Int
    let state: State
    let country: Country
    let countryAlfa2, addressCountryAlfa2: CountryAlfa2
    let geoLocation: GeoLocation

    enum CodingKeys: String, CodingKey {
        case zipcode, street, streetName, address, fullAddress,
            neighborhood, city, state, country, countryAlfa2, geoLocation
        case addressFullAddress = "full_address"
        case addressStreetName = "street_name"
        case idAtlasNeighborhood = "id_atlas_neighborhood"
        case idNeighborhood = "id_neighborhood"
        case idAtlasCity = "id_atlas_city"
        case idCity = "id_city"
        case idAtlasState = "id_atlas_state"
        case idState = "id_state"
        case idAtlasCountry = "id_atlas_country"
        case idCountry = "id_country"
        case addressCountryAlfa2 = "country_alfa2"
    }
}
