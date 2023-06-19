//
//  CadastroViewModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 09/06/23.
//

import Foundation

class CadastroViewModel {
     var disposable = DisposeBag()
    
    var db = firebaseBD.firestore()
    
    var cadastroModel: CadastroModel = CadastroModel()
    
    var nome: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var email: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var senha: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var confirmarSenha: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var camposPreenchidos: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    func bindViewModel() {
        nome.bind {
            nome in
            self.cadastroModel.setarNome(nome: nome)
            self.camposPreenchidos.accept(self.cadastroModel.verificarCampos())
        }.disposed(by: disposable)
        
        email.bind {
            email in
            self.cadastroModel.setarEmail(email: email)
            self.camposPreenchidos.accept(self.cadastroModel.verificarCampos())
        }.disposed(by: disposable)
        
        senha.bind {
            senha in
            self.cadastroModel.setraSenha(senha: senha)
            self.camposPreenchidos.accept(self.cadastroModel.verificarCampos())
        }.disposed(by: disposable)
        
        confirmarSenha.bind {
            confirmarSenha in
            self.cadastroModel.setarConfirmar(senha: confirmarSenha)
            self.camposPreenchidos.accept(self.cadastroModel.verificarCampos())
        }.disposed(by: disposable)
        
    }
    
    func cadastrar() {
        
    }
    
    
    
    
    
    
//    func cadastrar() {
//        AuthFirebase.auth().createUser(withEmail: cadastroModel.email, password: cadastroModel.senha) {
//            resultado, erro in
//
//            if let erro = erro {
//                print("deu ruim")
//                print(erro.localizedDescription)
//            }
//
//            if let resultado = resultado {
//                print("Usuario Cadastrado com sucesso")
//                print(resultado.user.email ?? "")
//
//                self.db.collection("usuarios").document("\(resultado.user.email)").setData([
//                    "nome": self.cadastroModel.nome,
//                    "senha": self.cadastroModel.senha
//                ]) {
//                    erro in
//                    if let erro = erro {
//                        print(erro.localizedDescription)
//                    } else {
//                        print("cadastrado com sucesso")
//                    }
//
//                }
//
//            }
//        }
//    }
}
