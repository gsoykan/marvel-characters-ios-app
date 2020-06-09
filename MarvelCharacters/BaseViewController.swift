//
//  BaseViewController.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController, NameDescribable, BaseDelegate {    
    func presentNullable(_ viewControllerToPresent: UIViewController?, animated flag: Bool, completion: (() -> Void)? = nil) {
        guard let viewController = viewControllerToPresent else {
            assertionFailure()
            return
        }
        present(viewController, animated: flag, completion: completion)
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    func showError(_ message: String? = nil) {
        DispatchQueue.main.async {
            SVProgressHUD.showError(withStatus: message)
        }
    }
    
    func showSuccess(_ message: String? = nil) {
        DispatchQueue.main.async {
            SVProgressHUD.showSuccess(withStatus: message)
        }
    }
}
