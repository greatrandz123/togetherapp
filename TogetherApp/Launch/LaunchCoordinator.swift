//
//  LaunchCoordinator.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit

struct LaunchCoordinator: Coordinator {
    private(set) weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    enum scene {
        case login
        case dashboard
    }
    
    func start() {
        let service = LaunchService()
        let viewModel = LaunchViewModel(coordinator: self, service: service)
        let viewController = LaunchViewController(viewModel: viewModel)
        navigationController?.navigationBar.isHidden = true
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    
}
