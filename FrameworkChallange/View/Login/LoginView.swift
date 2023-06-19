//
//  LoginView.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 24/05/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    var lblLogin: UILabel = {
        var lbl = UILabel()
        lbl.text = "Bem vindo!"
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var campoEmail: TextFieldForm = {
        var txt = TextFieldForm()
        txt.setarTitulo(titulo: "E-mail:")
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
        
    }()
    
    var campoSenha: TextFieldForm = {
        var txt = TextFieldForm()
        txt.setarTitulo(titulo: "Senha:")
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
        
    }()
    
    var btnEntrar: UIButton = {
        var btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Entrar", for: .normal)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    var btnCadastrar: UIButton = {
        var btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Cadastrar", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gerarSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        gerarSubViews()
    }
    
    func gerarSubViews(){
        backgroundColor = .white
        setarTitulo()
        setarCamposEmail()
        setarCamposSenha()
        setarBotaoEntrar()
    }
    
    func setarTitulo(){
        addSubview(lblLogin)
        NSLayoutConstraint.activate([
            lblLogin.topAnchor.constraint(equalTo: topAnchor, constant: size.height * 0.1),
            lblLogin.leadingAnchor.constraint(equalTo: leadingAnchor),
            lblLogin.trailingAnchor.constraint(equalTo: trailingAnchor),
            lblLogin.heightAnchor.constraint(equalToConstant: 50)
    
        ])
        
    }
    
    func setarCamposEmail(){
        addSubview(campoEmail)
        NSLayoutConstraint.activate([
            campoEmail.topAnchor.constraint(equalTo: lblLogin.bottomAnchor, constant: size.height * 0.3),
            campoEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            campoEmail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22)
            
        ])
    }
    
    func setarCamposSenha(){
        addSubview(campoSenha)
        NSLayoutConstraint.activate([
            campoSenha.topAnchor.constraint(equalTo: campoEmail.bottomAnchor, constant: 15),
            campoSenha.trailingAnchor.constraint(equalTo: campoEmail.trailingAnchor),
            campoSenha.leadingAnchor.constraint(equalTo: campoEmail.leadingAnchor)
            
        ])
    }
    
    func setarBotaoEntrar(){
        addSubview(btnEntrar)
        NSLayoutConstraint.activate([
            btnEntrar.topAnchor.constraint(equalTo: campoSenha.bottomAnchor, constant: size.height * 0.05),
            btnEntrar.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnEntrar.widthAnchor.constraint(equalToConstant: size.width * 0.5),
            btnEntrar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        addSubview(btnCadastrar)
        NSLayoutConstraint.activate([
            btnCadastrar.topAnchor.constraint(equalTo: btnEntrar.bottomAnchor, constant: 10),
            btnCadastrar.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnCadastrar.widthAnchor.constraint(equalToConstant: size.width * 0.5),
            btnCadastrar.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        
    }
    
    func tratarEntrar(habilitado: Bool) {
        
        if habilitado {
            self.btnEntrar.backgroundColor = .blue
            self.btnEntrar.isEnabled = true
        } else {
            self.btnEntrar.backgroundColor = .gray
            self.btnEntrar.isEnabled = false
        }
    }
    
    
}
