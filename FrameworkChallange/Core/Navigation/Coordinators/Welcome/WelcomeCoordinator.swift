//
//  WelcomeCoordinator.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit

class WelcomeCoordinator: CoordinatorProtocol {
    
    var childCoordinators = [CoordinatorProtocol]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        welcomeView()
    }
    
    func welcomeView() {
        let navigator = WelcomeViewController()
        navigator.coordinator = self
        navigationController.pushViewController(navigator, animated: true)
    }
}
