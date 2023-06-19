//
//  LoginCoordinator.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 25/05/23.
//

import Foundation
import UIKit

class LoginCoordinator:CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init (navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let navigation = LoginViewController()
        navigation.coordinator = self
        navigationController.pushViewController(navigation, animated: true)
    }
    func cadastro() {
        let navigation = CadastroViewController()
        navigationController.pushViewController(navigation, animated: true)
    }
    
}

