//
//  APIRouter.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

enum APIRouter {
    private var requiredParams: String { "apikey=\(Constants.Networking.publicKey)&hash=\(Constants.Networking.apiHash)&ts=\(Constants.Networking.timestamp ?? "")" }
    
    case characters(limit: Int, Offset: Int)
    
    var endpoint: String {
        switch self {
        case let .characters(limit, offset):
            return "/characters?limit=\(limit)&offset=\(offset)&\(requiredParams)"
        }
    }
    
    var httpMethod: String {
        switch self {
        case .characters:
            return "GET"
        }
    }
}
