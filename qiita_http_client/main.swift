//
//  main.swift
//  qiita_http_client
//
//  Created by Hiromichi Ema on 2017/03/24.
//  Copyright © 2017年 Hiromichi Ema. All rights reserved.
//

import Foundation

print("please enter your perPage query > ")

guard let perPage = readLine(strippingNewline: true) else {
    exit(1)
}

print("please enter your page > ")

guard let page = readLine(strippingNewline: true) else {
    exit(1)
}

let client = QiitaClient()
let request = QiitaApi.getItem(perPage: perPage, page: page)
client.send(request: request) { result in
    
    switch result{
    case let .success(response):
        for item in response.items {
            print(item.title)
        }
        exit(0)
    case let .failure(error):
        print(error)
        exit(9)
    }
}

let interval: TimeInterval = 60
Thread.sleep(forTimeInterval: interval)

print("Time out")
exit(9)

// Userを取得する時
//print("please enter your perPage query > ")
//
//guard let perPage = readLine(strippingNewline: true) else {
//    exit(1)
//}
//
//print("please enter your page > ")
//
//guard let page = readLine(strippingNewline: true) else {
//    exit(1)
//}
//
//let client = QiitaClient()
//let request = QiitaApi.getUser(perPage: perPage, page: page)
//client.send(request: request) { result in
//    
//    switch result{
//    case let .success(response):
//        for item in response.items {
//            print(item.id)
//        }
//        exit(0)
//    case let .failure(error):
//        print(error)
//        exit(9)
//    }
//}
//
//let interval: TimeInterval = 60
//Thread.sleep(forTimeInterval: interval)
//
//print("Time out")
//exit(9)

