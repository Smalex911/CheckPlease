//
//  AppDelegate.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 13.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow? {
        didSet {
            window?.makeKeyAndVisible()
        }
    }
    var router = BaseRouter()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        router.openMain()
        
        return true
    }
}

