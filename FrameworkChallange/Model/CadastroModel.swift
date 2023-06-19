//
//  CadastroModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 09/06/23.
//

import Foundation

class CadastroModel {
    
    var nome: String
    var email: String
    var senha: String
    var confirmarSenha: String
   
    
    init() {
        self.nome = ""
        self.email = ""
        self.senha = ""
        self.confirmarSenha = ""
    }
    
    func setarNome(nome: String){
        self.nome = nome
    }
    
    func setarEmail(email: String){
        self.email = email
    }
    func setraSenha(senha: String){
        self.senha = senha
    }
    func setarConfirmar(senha: String) {
        self.confirmarSenha = senha
    }
    
    func verificarCampos() -> Bool {
        return (!nome.isEmpty && !email.isEmpty && !senha.isEmpty && !confirmarSenha.isEmpty && senhasIguais())
    }
    
    func senhasIguais() ->Bool {
        return senha == confirmarSenha
    }
    
}
