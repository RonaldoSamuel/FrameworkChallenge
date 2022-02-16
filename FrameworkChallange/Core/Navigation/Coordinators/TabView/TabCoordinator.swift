//
//  TabCoordinator.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit

class TabCoordinator: CoordinatorProtocol {
    
    var childCoordinators = [CoordinatorProtocol]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        tabView()
    }
    
    func tabView() {
        let navigator = MainTabViewController()
        navigator.coordinator = self
        navigationController.pushViewController(navigator, animated: true)
    }
}
