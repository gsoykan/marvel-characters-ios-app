//
//  Character.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

// MARK: - Result
struct Character: Codable, Hashable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        guard let lhsId = lhs.id,
            let rhsId = rhs.id else { return false }
        return lhsId == rhsId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.name)
    }
    
    let id: Int?
    let name, resultDescription: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

