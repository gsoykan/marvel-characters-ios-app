//
//  SelfSizedTableView.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 10.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import Foundation
import UIKit

class SelfSizedTableView: UITableView {
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: contentSize.width, height: contentSize.height)
    }
}
