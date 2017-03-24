//
//  JSONDecodeError.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

enum JSONDecodeError: Error {
    case invalidFormat(json: Any?)
    case missingValue(key: String, actualValue: Any?)
}
