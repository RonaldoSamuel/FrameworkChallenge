//
//  ViewModelProtocol.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation

protocol BaseViewModel {
    
    var disposable: DisposeBag { get set }
    func viewDidLoad()
}

extension BaseViewModel {
    
    func viewDidLoad() { }
}
