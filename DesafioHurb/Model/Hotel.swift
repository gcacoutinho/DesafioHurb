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
    let estrelas: Int?
    let galeria: [ImagemGaleria]
    let amenidades: [Amenidade]
    
    init (hotel: ResultItem) {
        self.nome = hotel.name ?? ""
        self.descricao = "\(hotel.smallDescription ?? "")" //"\(hotel.resultDescription ?? "")"
        self.estado = hotel.address?.state ?? ""
        self.cidade = hotel.address?.city ?? ""
        self.preco = hotel.price?.currentPrice ?? hotel.price?.amount ?? hotel.price?.totalPrice ?? 0.0
        self.moeda = hotel.price?.currency ?? hotel.price?.currencyOriginal ?? ""
        self.latitude = hotel.address?.geoLocation?.lat
        self.longitude = hotel.address?.geoLocation?.lon
        self.estrelas = hotel.stars
        self.galeria = hotel.gallery?.map({ gallery in
            ImagemGaleria(url: gallery.url, descricao: gallery.galleryDescription)
        }) ?? []
        self.amenidades = hotel.amenities?.compactMap({ amenidade in
            if let categoria = amenidade.category, let nome = amenidade.name {
                return Amenidade(categoria: categoria, nome: nome)
            }
            return nil
        }) ?? []
    }
    
    func getLocalizacao() -> String {
        return "\(cidade), \(estado)"
    }
    
    func getPrecoTexto() -> String {
        let locale = NSLocale(localeIdentifier: self.moeda)
        let simbolo = locale.displayName(forKey: .currencySymbol, value: self.moeda)
        return String(format: "\(simbolo ?? self.moeda) %.2f", self.preco)
    }
}
