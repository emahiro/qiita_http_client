//
//  QiitaRequest.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

protocol QiitaRequst {
    
    associatedtype Response: JSONDecodable
    
    var baseURL: URL { get }
    var resource: String { get }
    var method: String { get }
    var parameters: [String: Any] { get }
}

extension QiitaRequst {
    var baseURL: URL {
        return URL(string: "https://qiita.com/api/v2")!
    }
    
    var method: String {
        return "GET"
    }
    
    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(resource)
        var componetns = URLComponents(url: url, resolvingAgainstBaseURL: true)
        componetns?.queryItems = parameters.map { k, v in
            return URLQueryItem(name: k, value: String(describing: v))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.url = componetns?.url
        urlRequest.httpMethod = method
        return urlRequest
    }
    
    func response(from data: Data, urlResponse: URLResponse) throws -> Response {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        
        if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
            return try Response(json: json)
        }else {
            throw try QiitaApiError(json: json)
        }
    }
}
