//
//  String.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 10.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

extension String {
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
