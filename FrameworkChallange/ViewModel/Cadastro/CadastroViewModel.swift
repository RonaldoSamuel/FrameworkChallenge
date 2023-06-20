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
        
        AuthFirebase.auth().createUser(withEmail: cadastroModel.email, password: cadastroModel.senha) {
            resultado, erro in
            if let resultado = resultado {
                print("Usuário cadastrado com sucesso!")
                
                self.db.collection("Usuarios").document(self.email.value).setData([
                    "nome": self.cadastroModel.nome,
                    "senha": self.cadastroModel.senha
                ]) {
                    erro in
                    if let erro = erro {
                        print ("erro ao cadastrar usuario\(erro.localizedDescription)")
                    } else {
                        print ("Cadastrado com sucesso")
                    }
                    
                }
                
            }
            
            if let erro = erro {
                print("Falha ao cadastrar o usuário!")
            }
        }
        
    }
}
