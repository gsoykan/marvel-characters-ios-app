//
//  UITableView.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: NameDescribable & UITableViewCell>(_ cellType: T.Type) {
        let typeName = cellType.typeName
        register(UINib(nibName: typeName, bundle: nil), forCellReuseIdentifier: typeName)
    }
}
