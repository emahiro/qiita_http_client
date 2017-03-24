//
//  QiitaApi.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

final class QiitaApi {
    
    struct getItem: QiitaRequst {
        
        let perPage: String
        let page: String
        
        typealias Response = QiitaResponse<Item>
        
        var resource: String {
            return "/items"
        }
        
        var parameters: [String: Any] {
            return [
                "per_page" : perPage,
                "page" : page
            ]
        }
    }
    
    struct getUser: QiitaRequst {
        let perPage: String
        let page: String
        
        typealias Response = QiitaResponse<User>
        
        var resource: String {
            return "/users"
        }
        
        var parameters: [String : Any] {
            return [
                "per_paga": perPage,
                "page": page
            ]
        }
    }
}
