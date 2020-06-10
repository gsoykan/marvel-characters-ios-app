//
//  CharacterDetailDelegate.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 10.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation
import UIKit

protocol CharacterDetailDelegate: BaseDelegate {
    var character: Character! { get set }
    func adjustCoverImage(image: UIImage, newHeight: CGFloat)
}
