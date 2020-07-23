//
//  HotelCell.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 16/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import UIKit

class HotelCell: UITableViewCell {
    
    static let identifier = "HotelCell"
  
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var localizacao: UILabel!
    @IBOutlet weak var preco: UILabel!
    @IBOutlet private weak var galeria: UICollectionView!

    override func prepareForReuse() {
        super.prepareForReuse()
    
        self.tituloLabel.text = nil
        self.localizacao.text = nil
        self.preco.text = nil
    }
    
    func setCollectionViewDataSourceDelegate(_ dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        galeria.delegate = dataSourceDelegate
        galeria.dataSource = dataSourceDelegate
        galeria.tag = row
        galeria.reloadData()
    }
}
