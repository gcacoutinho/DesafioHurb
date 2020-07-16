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
  @IBOutlet weak var descricaoLabel: UILabel!

  override func prepareForReuse() {
    super.prepareForReuse()
    
    tituloLabel.text = nil
    descricaoLabel.text = nil
  }
}
