//
//  UserModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 24/05/23.
//

import Foundation

class UserModel {
    var email: String
    var senha: String
    
    init(email: String, senha: String) {
        self.email = email
        self.senha = senha
    }
    
    init(){
        self.email = ""
        self.senha = ""
    }
    
    func dadosValidos(user: UserModel) -> Bool{
        return (user.email == self.email) && (user.senha == self.senha)
    }
    
    func verificarCampos() -> Bool {
        return !email.isEmpty && !senha.isEmpty
    }
    
}
