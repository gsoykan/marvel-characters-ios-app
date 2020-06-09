//
//  UICollectionView.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 9.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func register<T: NameDescribable & UICollectionViewCell>(_ cellType: T.Type) {
        let typeName = cellType.typeName
        register(UINib(nibName: typeName, bundle: nil), forCellWithReuseIdentifier: typeName)
    }
}
