//
//  ViewControllerProtocol.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation

protocol BaseViewController {
    
    associatedtype View: BaseView
    associatedtype ViewModel: BaseViewModel
    associatedtype Navigation: CoordinatorProtocol
    
    var coordinator: Navigation? { get set }
    var disposable: DisposeBag { get set }
    
    var viewModel: ViewModel { get set }
    var presentationView: View { get set }
    
    func bindView()
}
