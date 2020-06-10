//
//  CharacterCollectionViewCell.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 9.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterCollectionViewCell: UICollectionViewCell, NameDescribable {
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelContainerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 20
        imageView.layer.cornerRadius = 20
        // TODO: Add shadow to containerView
        // TODO: Make label container gradient
    }
    
    func configure(with character: Character) {
        nameLabel.text = character.name ?? ""
        if let imageUrl = character.thumbnail?.url {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: imageUrl, options: [ .transition(.fade(0.32)), .cacheOriginalImage])
        }
    }
    
    func reset() {
        nameLabel.text = "loading"
        imageView.image = nil
    }
}
