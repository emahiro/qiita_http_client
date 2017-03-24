//
//  QiitaApiError.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

struct QiitaApiError:Error, JSONDecodable {
    
    let message: String
    let type: String
    
    init(json: Any) throws {
        guard let dict = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let message = dict["message"] as? String else {
            throw JSONDecodeError.missingValue(key: "message", actualValue: dict["message"])
        }
        
        guard let type = dict["type"] as? String else {
            throw JSONDecodeError.missingValue(key: "type", actualValue: dict["type"])
        }
        
        self.message = message
        self.type = type
    }
}
