//
//  CharacterDetailViewController.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 10.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import UIKit

class CharacterDetailViewController: BaseViewController, CharacterDetailDelegate {
    private var presenter: CharacterDetailPresenter!
    var character: Character!
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var coverImageHeigthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var comicTableView: SelfSizedTableView!
    private var comicNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        comicTableView.reloadData()
        super.viewDidAppear(animated)
    }
    
    private func configure() {
        presenter = CharacterDetailPresenter(delegate: self)
        presenter.fetchImage()
        nameLabel.text = character.name
        descriptionLabel.text = character.resultDescription
        comicNames = presenter.filterAndSortComics()
    }
    
    func adjustCoverImage(image: UIImage, newHeight: CGFloat) {
        coverImageView.image = image
        coverImageHeigthConstraint.constant = newHeight
        view.layoutIfNeeded()
    }
    
    @IBAction private func dismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = comicNames[safeIndex: indexPath.row]
        return cell
    }
}
