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
    static func getHotels(termo: String = "buzios", pag: Int) {
        AF.request("https://www.hurb.com/search/api?q=\(termo)&page=\(pag)")
            .responseDecodable(of: Response.self) { response in
            if let error = response.error {
                debugPrint(error)
                return
            }
            debugPrint(response)
        }
    }
}
