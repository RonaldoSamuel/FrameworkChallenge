//
//  LoginViewModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 24/05/23.
//

import Foundation

class LoginViewModel {
    var userAutenticar: BehaviorRelay<UserModel> = BehaviorRelay<UserModel>(value: UserModel(email: "123@gmail.com", senha: "1234567"))
    
    var userData: UserModel = UserModel()
    
    var email: BehaviorRelay<String> =  BehaviorRelay<String>(value: "")
    
    var senha: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    
    var logou: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    func setarEmail(email: String){
        self.email.accept(email)
        self.userData.email = email
        
    }
    
    func setarSenha(senha: String){
        self.senha.accept(senha)
        self.userData.senha = senha
        
    }
    
    func autenticar(){
        userData = UserModel(email: email.value, senha: senha.value)
        AuthFirebase.auth().signIn(withEmail: userData.email, password: userData.senha) {
            resultado, erro in
            if let resultado = resultado {
                self.logou.accept(true)
            }
            
            if let erro = erro {
                self.logou.accept(false)
            }
        }
        
    }
    
}
