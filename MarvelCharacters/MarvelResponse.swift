//
//  MarvelResponse.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 9.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

// MARK: - CharactersResponse
struct MarvelResponse<T: Codable>: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass<T>
}

// MARK: - DataClass
struct DataClass<T: Codable>: Codable {
    let offset, limit, total, count: Int
    let results: T?
}
