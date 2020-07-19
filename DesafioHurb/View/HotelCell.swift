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

  override func prepareForReuse() {
    super.prepareForReuse()
    
    self.tituloLabel.text = nil
    self.localizacao.text = nil
    self.preco.text = nil
  }
}
