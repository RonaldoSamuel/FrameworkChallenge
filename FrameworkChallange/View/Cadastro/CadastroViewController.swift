//
//  CadastroViewController.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 29/05/23.
//

import Foundation
import UIKit

class CadastroViewController: UIViewController {
    var presentationView = CadastroView()
    var viewModel = CadastroViewModel()
    var disposableBag = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        self.viewModel.bindViewModel()
        self.bindView()
    }
    
    func bindView(){
        presentationView.campoNome.textField.rx.text.bind {
            texto in
            self.viewModel.nome.accept(texto ?? "")
        } .disposed(by: disposableBag)
    
        presentationView.campoEmail.textField.rx.text.bind {
            texto in
            self.viewModel.email.accept(texto ?? "")
        }.disposed(by: disposableBag)
        
        presentationView.campoSenha.textField.rx.text.bind {
            texto in
            self.viewModel.senha.accept(texto ?? "")
            self.presentationView.senhasIguais(value: self.viewModel.cadastroModel.senhasIguais())
        }.disposed(by: disposableBag)
        
        presentationView.campoConfSenha.textField.rx.text.bind {
            texto in
            self.viewModel.confirmarSenha.accept(texto ?? "")
            self.presentationView.senhasIguais(value: self.viewModel.cadastroModel.senhasIguais())
        }.disposed(by: disposableBag)
        
        viewModel.camposPreenchidos.bind {
            value in
            self.presentationView.habilitarBotao(value: value)
        }.disposed(by: disposableBag)
        
        presentationView.btnConfirmar.rx.tapGesture().when(.recognized).bind {_ in
            self.viewModel.cadastrar()
        }.disposed(by: disposableBag)
    }
    
    
    
    
}



