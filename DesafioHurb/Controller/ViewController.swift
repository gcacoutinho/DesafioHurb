//
//  ViewController.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    public var api: HurbAPIAccess = HurbAPIAccess()
    
    var tabelaDados: [Hotel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 400
        self.tableView.dataSource = self
        
        self.tableView.showSkeleton()
        self.activityIndicator?.startAnimating()
        
        api.getHoteis(pagina: 1) { result in
            switch result {
            case let .success(hotel):
                self.tableView.hideSkeleton()
                self.tabelaDados = hotel
            case let .failure(error):
                let mensagemErro = error.asAFError?.errorDescription ?? "Aconteceu algo de errado 🤔"
                let alert = UIAlertController(title: "Erro", message: mensagemErro, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Ação padrão"), style: .default))
                self.present(alert, animated: true)
            }
            self.activityIndicator?.stopAnimating()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if
          segue.identifier == "HotelDetalhes",
          let hotelDetalhesViewController = segue.destination as? HotelDetalhesViewController,
          let hotelCell = sender as? HotelCell,
          let row = tableView.indexPath(for: hotelCell)?.row
        {
            let hotel = tabelaDados[row]

            hotelDetalhesViewController.hotel = hotel
        }
    }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let hotelCell = tableView.dequeueReusableCell(withIdentifier: HotelCell.identifier, for: indexPath) as! HotelCell

    let hotel = tabelaDados[indexPath.row]
    hotelCell.tituloLabel?.text = hotel.nome
    hotelCell.preco?.text = "\(hotel.moeda) \(hotel.preco)"
    hotelCell.localizacao?.text = hotel.getLocalizacao()

    return hotelCell
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tabelaDados.count
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}


