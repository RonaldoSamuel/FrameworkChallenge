//
//  LoginViewController.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 24/05/23.
//

import Foundation
import UIKit

class LoginViewController:UIViewController {
    var presentationView = LoginView()
    var viewModel = LoginViewModel()
    var disposable: DisposeBag = DisposeBag()
    weak var coordinator: LoginCoordinator?
    
    override func loadView() {
        view = presentationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTela()
    }
    
    func bindTela() {
        presentationView.campoEmail.textField.rx.text.bind{
            texto in
            self.viewModel.setarEmail(email: texto ?? "")
            self.presentationView.tratarEntrar(habilitado: self.viewModel.userData.verificarCampos())

        }.disposed(by: disposable)

        presentationView.campoSenha.textField.rx.text.bind{
            texto in
            self.viewModel.setarSenha(senha: texto ?? "")
            self.presentationView.tratarEntrar(habilitado: self.viewModel.userData.verificarCampos())
        }.disposed(by: disposable)

        presentationView.btnEntrar.rx.tapGesture().when(.recognized).bind{
            _ in
            self.viewModel.autenticar()
        }.disposed(by: disposable)
        
        presentationView.btnCadastrar.rx.tapGesture().when(.recognized).bind{
            _ in
            self.coordinator?.cadastro()
        }.disposed(by: disposable)
        
        viewModel.logou.bind { value in
            if value {
                self.coordinator?.parentCoordinator?.tabView()
            }
        }
    }
    
    
}

