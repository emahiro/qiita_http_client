//
//  Response.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

struct QiitaResponse<T: JSONDecodable>: JSONDecodable {
    
    let items: [T]
    
    init(json: Any) throws {
        guard let objs = json as? [Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        self.items = try objs.map {
            return try T(json: $0)
        }
    }
}
