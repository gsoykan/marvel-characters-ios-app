//
//  BaseDelegate.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

protocol BaseDelegate: class {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showError(_ message: String?)
    func showSuccess(_ message: String?)
}
