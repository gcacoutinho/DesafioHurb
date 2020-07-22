//
//  Hotel.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 20/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation

class Hotel {
    let nome: String
    let descricao: String
    let estado: String
    let cidade: String
    let preco: Double
    let moeda: String
    let latitude: Double?
    let longitude: Double?
    let galeria: [ImagemGaleria]
    
    init (hotel: ResultItem) {
        self.nome = hotel.name ?? ""
        self.descricao = "\(hotel.resultDescription ?? "") \n\n\n\n \(hotel.smallDescription ?? "")"
        self.estado = hotel.address?.state ?? ""
        self.cidade = hotel.address?.city ?? ""
        self.preco = hotel.price?.currentPrice ?? 0.0
        self.moeda = hotel.price?.currency ?? ""
        self.galeria = hotel.gallery?.map({ gallery in
            ImagemGaleria(url: gallery.url, descricao: gallery.galleryDescription)
        }) ?? []
        self.latitude = hotel.address?.geoLocation?.lat
        self.longitude = hotel.address?.geoLocation?.lon
    }
    
    func getLocalizacao() -> String {
        return "\(cidade), \(estado)"
    }
}
