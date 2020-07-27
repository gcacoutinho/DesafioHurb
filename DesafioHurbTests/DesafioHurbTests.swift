//
//  DesafioHurbTests.swift
//  DesafioHurbTests
//
//  Created by Gabriel Coutinho on 26/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import XCTest
import Alamofire
@testable import DesafioHurb

class DesafioHurbTests: XCTestCase {

    let api = HurbAPIAccess()
    
    override func setUp() {
        api.session = AF
    }
    
    func testGetHoteisPaginaInicial() {
        let expectation = XCTestExpectation(description: "Retornar hoteis de búzios.")
        api.getHoteis() { response in
            switch response {
            // Se retornar um sucesso
            case let .success(hoteis):
                // Que a lista de hoteis NÃO esteja vazia
                XCTAssertTrue(!hoteis.isEmpty)
            // Se retornar uma falha
            case let .failure(erro):
                // Teste falhou
                XCTFail("Requisição falhou.\nErro: \(erro)")
            }
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 3.0)
    }
    
    func testTermoVazio() {
        let api = HurbAPIAccess()
        api.session = AF
        let expectation = XCTestExpectation(description: "Erro ao buscar com termo vazio.")
        api.getHoteis(termo: "", pagina: 1) { response in
            switch response {
            // Se retornar um sucesso
            case let .success(hoteis):
                // Que a lista de hoteis esteja vazia
                XCTAssertTrue(hoteis.isEmpty)
            // Se retornar uma falha
            case let .failure(erro):
                // Que seja porque a resposta não foi serializada
                XCTAssertTrue(erro.asAFError?.isResponseSerializationError ?? false)
            }
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 3.0)
    }

}
