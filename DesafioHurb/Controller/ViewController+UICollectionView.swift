//
//  ViewController+UICollectionView.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 22/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SkeletonView

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabelaDados[collectionView.tag].galeria.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hotel = tabelaDados[collectionView.tag]
        let galeria = hotel.galeria
        if let itemGaleria = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemGaleria", for: indexPath) as? ImagemGaleriaCell,
            let url = galeria[indexPath.row].url {
            itemGaleria.imagem.showAnimatedGradientSkeleton()
            AF.request(url).responseImage { response in
                switch response.result {
                case .success(let image):
                    itemGaleria.imagem.image = image
                case.failure(let error):
                    debugPrint(error)
                }
                itemGaleria.imagem.hideSkeleton()
            }
            return itemGaleria
        }
        return UICollectionViewCell()
    }
}
