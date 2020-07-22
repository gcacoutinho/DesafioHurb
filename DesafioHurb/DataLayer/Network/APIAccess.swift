//
//  APIAccess.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation
import Alamofire

class HurbAPIAccess {
    func getHoteis(termo: String = "buzios", pagina: Int,
                          completionHandler: @escaping (Result<[Hotel], Error>) -> Void) {
        let url = "https://www.hurb.com/search/api?q=\(termo)&page=\(pagina)"
        AF.request(url).responseDecodable(of: Response.self) { response in
            do {
                let response = try response.result.get()
                let hoteis = response.results!.map(Hotel.init)
                completionHandler(.success(hoteis))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
}
