//
//  AlamofireLogger.swift
//  DesafioHurb
//
//  Created by Gabriel Coutinho on 26/07/20.
//  Copyright © 2020 Gabriel Coutinho. All rights reserved.
//

import Foundation
import Alamofire

final class AlamofireLogger: EventMonitor {
    func requestDidResume(_ request: Request) {
        let body = request.request.flatMap { $0.httpBody.map { String(decoding: $0, as: UTF8.self) } } ?? "None"
        let message = """
        ⚡️ Request Started: \(request)
        ⚡️ Body Data: \(body)
        """
        NSLog(message)
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: AFDataResponse<Value>) {
        NSLog("⚡️ Response Received: \(response.debugDescription)")
        if let erro = response.error {
            NSLog("⚡️ ⚠️ Error Description: \(erro.errorDescription ?? "nil")")
            NSLog("⚡️ ⚠️ Failure Reason: \(erro.failureReason ?? "nil")")
        }
    }
}
