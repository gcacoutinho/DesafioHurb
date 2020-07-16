//
//  APIAccess.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 10/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation
import Alamofire

class APIAcess {
    static func getHotels(termo: String = "buzios", pag: Int,
                          completionHandler: @escaping (Response?, AFError?) -> Void) {
        let url = "https://www.hurb.com/search/api?q=\(termo)&page=\(pag)"
        AF.request(url).responseDecodable(of: Response.self) { response in
                completionHandler(response.value, response.error)
        }
    }
}
