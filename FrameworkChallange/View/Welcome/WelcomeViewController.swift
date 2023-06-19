//
//  WelcomeViewController.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import UIKit
import CoreData

class WelcomeViewController: UIViewController {
    typealias View = LoginView
    typealias Navigation = WelcomeCoordinator
    
    var presentationView = LoginView()
    weak var coordinator: WelcomeCoordinator?
    var disposable: DisposeBag = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    func bindView() {
//        presentationView.enterButton.rx
//            .tapGesture().when(.recognized)
//            .subscribe(
//                onNext: { _ in
//                    self.coordinator?.parentCoordinator?.tabView()
//                })
//            .disposed(by: disposable)
        
    }
    
}
