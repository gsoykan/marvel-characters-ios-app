//
//  CharacterDetailPresenter.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 10.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation
import Kingfisher

class CharacterDetailPresenter {
    weak var delegate: CharacterDetailDelegate!
    
    init(delegate: CharacterDetailDelegate) {
        self.delegate = delegate
    }
    
    func fetchImage() {
        guard let imageUrl = delegate.character.thumbnail?.url else { return }
        let resource = ImageResource(downloadURL: imageUrl, cacheKey: imageUrl.absoluteString)
        KingfisherManager.shared.retrieveImage(with: resource) {
            [weak self] result in
            switch result {
            case .success(let value):
                let aspectRatio = value.image.size.width / value.image.size.height
                let newHeight = UIScreen.screenWidth / aspectRatio
                self?.delegate.adjustCoverImage(image: value.image, newHeight: newHeight)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func filterAndSortComics() -> [String]  {
        guard let comics = delegate.character.comics?.items else { return [] }
        let rawResult = comics.lazy.filter {
            guard let year = self.extractYear(from: $0.name) else { return false }
            return year > 2005
        }
        .sorted { (item1, item2) in
            guard let item1Year = extractYear(from: item1.name),
                let item2Year = extractYear(from: item2.name) else { return false}
            return item1Year > item2Year
        }
        .prefix(10)
        .compactMap { $0.name }
        return rawResult
    }
    
    private func extractYear(from comicName: String?) -> Int? {
        guard let yearSlice = comicName?.slice(from: "(", to: ")") else { return nil }
        return Int(yearSlice)
    }
}
