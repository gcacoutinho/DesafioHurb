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
    
    var results: [Result]? {
        didSet {
            if isViewLoaded {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
//        APIAcess.getHotels(pag: 1) { (result, error) in
//            self.results = result?.results
//        }
    }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let hotelCell = tableView.dequeueReusableCell(withIdentifier: HotelCell.identifier, for: indexPath) as! HotelCell
    
    if let hotel = results?[indexPath.row] {
        hotelCell.tituloLabel?.text = hotel.name
        hotelCell.descricaoLabel?.text = hotel.resultDescription
    }
    
    return hotelCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return results?.count ?? 0
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}


