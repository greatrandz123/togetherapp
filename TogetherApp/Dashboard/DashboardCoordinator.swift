//
//  DashboardCoordinator.swift
//  TogetherApp
//
//  Created by Randolf Dini-ay on 10/8/21.
//

import UIKit

struct DashboardCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let navigationController = self.navigationController else {
            return
        }
        
        navigationController.navigationBar.isHidden = false
        let coordinator = DashboardCoordinator(navigationController: navigationController)
        let viewModel = DashboardViewModel(coordinator: coordinator)
        let viewController = DashboardViewController(viewModel: viewModel)
        
        DispatchQueue.main.async {
            
            UIView.transition(with: navigationController.view,
                              duration: 0.5,
                              options: UIView.AnimationOptions.transitionCrossDissolve,
                              animations: {
                                navigationController.setViewControllers([viewController], animated: false)
                                
            }, completion: nil)
            
        }
    }
    
}
