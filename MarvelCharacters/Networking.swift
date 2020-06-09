//
//  Networking.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

extension Constants {
    struct Networking {
        //All calls to the Marvel Comics API must pass your public key via an “apikey” parameter.
        //Public Key: 4d068da6721a062cd1b07a5eb728bf89
        static let baseURL: String = "http://gateway.marvel.com/v1/public"
        static let publicKey: String = "4d068da6721a062cd1b07a5eb728bf89"
        static let privateKey: String = "4b5916a525ad5f5f49d4b28333e255b9bad15192"
        static let contentTypeKey  = "Content-Type"
        static let contentTypeJSONValue = "application/json; charset=utf-8"
        static var apiHash: String {
            let ts =  String(Date().timeIntervalSince1970)
            timestamp = ts
            return Crypto.MD5(ts + privateKey + publicKey )
        }
        static var timestamp: String?
    }
}
