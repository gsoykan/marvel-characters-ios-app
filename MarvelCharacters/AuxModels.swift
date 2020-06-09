//
//  AuxModels.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 9.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

// MARK: - Comics
struct Comics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String?
    let name: String?
    /// can be cover, interiorStory etc
    let type: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    /// can be gif, jpg etc
    let thumbnailExtension: String?
    var url: URL? {
        guard let path = path,
        let thumbnailExtension = thumbnailExtension else { return nil }
        return URL(string: path + "." + thumbnailExtension)
    }

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    /// can be comiclink, detail, wiki etc
    let type: String?
    let url: String?
}
