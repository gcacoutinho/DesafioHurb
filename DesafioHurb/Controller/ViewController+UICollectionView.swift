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

    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let hotel = self.tabelaDados[collectionView.tag]
        let imagem = hotel.galeria[indexPath.row]
        return UIContextMenuConfiguration(identifier: nil, previewProvider: {
            return nil
        }, actionProvider: { suggestedActions in
            return self.criarMenuContextual(para: hotel, comImagem: imagem.url ?? "")
        })
    }
    
    func criarMenuContextual(para hotel: Hotel, comImagem imagemUrl: String) -> UIMenu {
        let compartilhar = UIAction(title: "Compartilhar", image: UIImage(systemName: "square.and.arrow.up")) { action in
            AF.request(imagemUrl).responseImage { response in
                let texto = "Olha esse hotel que achei no Hurb!\n\(hotel.nome)\n\(hotel.getLocalizacao())"
                var itens: [Any] = [texto]
                do {
                    let response = try response.result.get()
                    itens.append(response)
                } catch { }
                
                // Só ta mandando os dois (imagem e texto) pelo Telegram e não Whatsapp
                
                let activityViewController = UIActivityViewController(activityItems: itens, applicationActivities: nil)
                self.present(activityViewController, animated: true, completion: nil)
            }
        }

        return UIMenu(title: hotel.nome, children: [compartilhar])
    }
}
