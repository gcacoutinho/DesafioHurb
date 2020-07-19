//
//  ViewController.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableData: Response? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 400
        self.tableView.dataSource = self
        APIAcess.getHotels(pag: 1) { (result, error) in
            self.tableData = result
        }
    }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let hotelCell = tableView.dequeueReusableCell(withIdentifier: HotelCell.identifier, for: indexPath) as! HotelCell
    
    if let hotel = tableData?.results?[indexPath.row] {
        hotelCell.tituloLabel?.text = hotel.name
        hotelCell.preco?.text = "\(hotel.price?.currency ?? "R$") \(String(hotel.price?.currentPrice ?? 0))"
        let cidade = hotel.address?.city
        hotelCell.localizacao?.text = "\(cidade ?? "")\(cidade != nil ? ", " : "")\(hotel.address?.state ?? "")"
    }
    
    return hotelCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData?.results?.count ?? 0
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}


