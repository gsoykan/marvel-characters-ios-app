//
//  CharacterListingProtocol.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

protocol CharacterListingDelegate: BaseDelegate {
    var characters: [Character]? { get set }
}
