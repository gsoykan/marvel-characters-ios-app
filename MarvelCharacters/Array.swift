//
//  Array.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 9.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
}
