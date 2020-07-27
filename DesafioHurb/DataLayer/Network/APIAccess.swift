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
    private var paginaAtual: Int = 1
    private var paginaSeguinte: Int = 2
    public var session = Session(eventMonitors: [AlamofireLogger()])
    
    func getHoteis(termo: String, pagina: Int,
                          completionHandler: @escaping (Result<[Hotel], Error>) -> Void) {
        let url = "https://www.hurb.com/search/api?q=\(termo)&page=\(pagina)"
        session.request(url).responseDecodable(of: Response.self) { response in
            do {
                let response = try response.result.get()
                let hoteis = response.results!.map(Hotel.init)
                completionHandler(.success(hoteis))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
    
    func getHoteis(completionHandler: @escaping (Result<[Hotel], Error>) -> Void) {
        let url = "https://www.hurb.com/search/api?q=buzios&page=\(paginaAtual)&sort=stars"
        session.request(url).responseDecodable(of: Response.self) { response in
            do {
                let response = try response.result.get()
                let hoteis = response.results!.map(Hotel.init)
                self.paginaAtual = self.paginaSeguinte
                self.paginaSeguinte = Int(response.pagination?.nextPage ?? "") ?? self.paginaAtual + 1
                completionHandler(.success(hoteis))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
}
