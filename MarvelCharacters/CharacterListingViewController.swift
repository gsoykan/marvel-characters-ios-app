//
//  CharacterListingViewController.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import UIKit

class CharacterListingViewController: BaseViewController, CharacterListingDelegate {
    private var presenter: CharacterListingPresenter!
    var characters: [Character]? {
        willSet {
            guard let updatedChars = newValue else {
                return
            }
            let indexPathsForUpdate = ((characters?.endIndex ?? 0)..<updatedChars.endIndex).map { IndexPath(item: $0, section: 0) }
            let indexPathsForPrefetch = (updatedChars.endIndex..<itemCount).map { IndexPath(item: $0, section: 0) }
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.performBatchUpdates({
                    self?.collectionView.reloadItems(at: indexPathsForUpdate)
                    self?.collectionView.insertItems(at: indexPathsForPrefetch)
                }, completion: nil)
                
            }
        }
    }
    var itemCount: Int = 30
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        presenter = CharacterListingPresenter(delegate: self)
        collectionView.register(CharacterCollectionViewCell.self)
        presenter.getCharacters()
    }
}

extension CharacterListingViewController: UICollectionViewDelegate {
    
}

extension CharacterListingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.typeName, for: indexPath) as? CharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let character = characters?[safeIndex: indexPath.item] else {
            cell.reset()
            return cell
        }
        cell.configure(with: character)
        return cell
    }
}

extension CharacterListingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2.0, height: collectionView.bounds.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}

extension CharacterListingViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let characters = characters,
            let maxIndex = indexPaths.max()?.item
            else { return }
        if characters[safeIndex: maxIndex] == nil {
            presenter.getCharacters()
        }
    }
}
