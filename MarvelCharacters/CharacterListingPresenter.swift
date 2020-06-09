//
//  CharacterListingPresenter.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation

// TODO: impl detail page
// TODO: check some images returning funny

class CharacterListingPresenter {
    weak var delegate: CharacterListingDelegate!
    private let limit = 30
    private var offset = 0 {
        didSet {
            debugPrint("offset: \(offset)")
            delegate.itemCount = (delegate.characters?.count ?? 0) + 2 * limit
        }
    }
    
    enum FetchingState {
         case initialLoading
         case loading
         case ready
         case end
     }
    
    private var fetchingState: FetchingState! {
        didSet {
            switch fetchingState {
            case .end:
                delegate.itemCount = delegate.characters?.count ?? 0
            default:
                break
            }
        }
    }
    
    init(delegate: CharacterListingDelegate) {
        self.delegate = delegate
        fetchingState = .initialLoading
    }
    
    func fetchCharacters() {
        guard fetchingState == .ready || fetchingState == .initialLoading else { return }
        if fetchingState == .initialLoading {
            delegate.showActivityIndicator()
        }
        let previousState = fetchingState
        fetchingState = .loading
        APIClient.shared.request(router: APIRouter.characters(limit: limit, Offset: offset)) { [weak self] (result: Result<MarvelResponse<[Character]>, Error>) in
            guard let strongSelf = self else { return }
            if previousState == .initialLoading {
                strongSelf.delegate.hideActivityIndicator()
            }
            switch result {
            case let .success(response):
                if response.data.results?.isEmpty ?? true {
                    strongSelf.fetchingState = .end
                } else {
                    strongSelf.offset += strongSelf.limit
                }
                let cleanResults = response.data.results?.filter(strongSelf.legitimizeCharacter(_:)) ?? []
                guard (self?.delegate.characters) != nil else {
                    strongSelf.delegate.characters = cleanResults
                    strongSelf.fetchingState = .ready
                    return
                }
                strongSelf.delegate.characters?.append(contentsOf: cleanResults)
            case let .failure(error):
                strongSelf.delegate.showError(error.localizedDescription)
            }
            strongSelf.fetchingState = .ready
        }
    }
    
    private func legitimizeCharacter(_ character: Character) -> Bool {
        let necessaryFields: [Any?] = [character.id, character.name, character.thumbnail?.url]
        let nilCheck = necessaryFields.map { $0 != nil }
        return !nilCheck.contains(false)
    }
}

