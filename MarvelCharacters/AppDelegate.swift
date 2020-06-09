//
//  AppDelegate.swift
//  MarvelCharacters
//
//  Created by gurkan soykan on 8.06.2020.
//  Copyright © 2020 gurkan soykan. All rights reserved.
//

import UIKit
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupSVProgressHUD()
        return true
    }
    
    private func setupSVProgressHUD() {
        // More customization can be found at "https://github.com/SVProgressHUD/SVProgressHUD"
        SVProgressHUD.setRingRadius(18)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setMaximumDismissTimeInterval(3)
        SVProgressHUD.setForegroundColor(.watermelon)
        SVProgressHUD.setBackgroundColor(.almostWhite)
    }
}

