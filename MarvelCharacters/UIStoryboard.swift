//
//  UIStoryboard.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    static let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    func instantiate<T: NameDescribable & UIViewController>(_ viewController: T.Type) -> T? {
        instantiateViewController(withIdentifier: viewController.typeName) as? T
    }
}
