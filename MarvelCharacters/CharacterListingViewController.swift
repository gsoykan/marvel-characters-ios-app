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
        didSet {
            DispatchQueue.main.async { [weak self] in
                   self?.collectionView.reloadData()
               }
        }
    }
    
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
        return characters?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.typeName, for: indexPath) as? CharacterCollectionViewCell,
            let character = characters?[safeIndex: indexPath.item] else {
            return UICollectionViewCell()
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

