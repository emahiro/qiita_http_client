//
//  QiitaClient.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

final class QiitaClient {
    
    private var session: URLSession {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }
    
    func send<Request: QiitaRequst>(request: Request, completion: @escaping (Result<Request.Response, QiitaClientError>) -> Void) {
        let task = session.dataTask(with: request.buildURLRequest()) { data, response, error in
            switch (data, response, error) {
            case (_, _, let error?):
                completion(Result(error: QiitaClientError.connectionError(error)))
            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    completion(Result(value: response))
                } catch let e as QiitaApiError {
                    completion(Result(error: QiitaClientError.apiError(e)))
                } catch let e {
                    completion(Result(error: QiitaClientError.responseParseError(e)))
                }
    
            default:
                fatalError("Invalid URLResponse Combination data: \(data) response: \(response) errpr: \(error)")
            }
        }
        
        task.resume()
        
    }
}
