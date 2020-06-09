//
//  CharacterListingPresenter.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

// TODO: implement pagination
// TODO: impl prefetcher logic
// TODO: impl detail page
// TODO: check some images returning funny

class CharacterListingPresenter {
    weak var delegate: CharacterListingDelegate!
    private let limit = 30
    private var offset = 0
    
    init(delegate: CharacterListingDelegate) {
        self.delegate = delegate
    }
    
    func getCharacters() {
        delegate.showActivityIndicator()
        APIClient.shared.request(router: APIRouter.characters(limit: limit, Offset: offset)) { [weak self] (result: Result<MarvelResponse<[Character]>, Error>) in
            guard let strongSelf = self else { return }
            strongSelf.delegate.hideActivityIndicator()
            switch result {
            case let .success(response):
                let cleanResults = response.data.results?.compactMap { $0 }.filter(strongSelf.legitimizeCharacter(_:)) ?? []
                guard (self?.delegate.characters) != nil else {
                    strongSelf.delegate.characters = cleanResults
                    return
                }
                strongSelf.delegate.characters?.append(contentsOf: cleanResults)
            case let .failure(error):
                strongSelf.delegate.showError(error.localizedDescription)
            }
        }
    }
    
    private func legitimizeCharacter(_ character: Character) -> Bool {
        let necessaryFields: [Any?] = [character.id, character.name, character.thumbnail?.url]
        let nilCheck = necessaryFields.map { $0 != nil }
        return !nilCheck.contains(false)
    }
}

