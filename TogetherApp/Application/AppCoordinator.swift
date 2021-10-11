//
//  AppCoordinator.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit

struct AppCoodinator: Coordinator {

    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    var navigationController: UINavigationController? {
        return window.rootViewController as? UINavigationController
    }
    
    func start() {
        
        let rootNavigationController = configuredNavigationController
        let coordinator = LaunchCoordinator(navigationController: rootNavigationController)
        coordinator.start()
        window.makeKeyAndVisible()
        window.rootViewController = rootNavigationController
    }
    
}
