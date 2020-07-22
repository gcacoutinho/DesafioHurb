//
//  HotelDetalhesViewController.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 21/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import UIKit
import MapKit

class HotelDetalhesViewController: UIViewController {
    
    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var descricao: UILabel!
    
    var latitude: Double?
    var longitude: Double?
    var hotel: Hotel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if hotel == nil {
            let mensagemErro = "Não consegui pegar informações desse hotel."
            let alert = UIAlertController(title: "Aconteceu algo de errado 🤔", message: mensagemErro, preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(title: NSLocalizedString("Ok", comment: "Ação padrão"),
                              style: .default,
                              handler: { action in
                                self.performSegue(withIdentifier: "HotelDetalhes", sender: self)
            }))
            self.present(alert, animated: true)
        }
        
        self.nome.text = hotel?.nome
        self.descricao.text = hotel?.descricao
        self.latitude = hotel?.latitude
        self.longitude = hotel?.longitude
        
        if latitude != nil && longitude != nil {
            let coordenadas = CLLocation(latitude: latitude!, longitude: longitude!)
            mapa.centralizarLocalizacao(coordenadas)
            let anotacao = MKPointAnnotation()
            anotacao.coordinate = coordenadas.coordinate
            mapa.addAnnotation(anotacao)
        } else {
            mapa.isHidden = true
        }
    }
}

private extension MKMapView {
    func centralizarLocalizacao(_ coordenadas: CLLocation, raio: CLLocationDistance = 500) {
        setRegion(MKCoordinateRegion(
            center: coordenadas.coordinate,
            latitudinalMeters: raio,
            longitudinalMeters: raio),
                  animated: true)
    }
}
