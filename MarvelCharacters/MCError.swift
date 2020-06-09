//
//  MCError.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

enum MCError: Error {
    case clientError
    case serverError
    case prematureError(reason: String)
}
