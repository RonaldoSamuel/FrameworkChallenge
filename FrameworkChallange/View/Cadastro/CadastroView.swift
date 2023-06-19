//
//  CadastroView.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 29/05/23.
//

import Foundation
import UIKit

class CadastroView: UIView {
    
    var safeArea: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lblTitulo: UILabel = {
        var lbl = UILabel()
        lbl.text = "Cadastro"
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var campoNome: TextFieldForm = {
        var txt = TextFieldForm()
        txt.setarTitulo(titulo: "Nome:")
        txt.setarTipoDoTexto(tipo: .namePhonePad)
        txt.translatesAutoresizingMaskIntoConstraints = false
       return txt
    }()
    
    var campoEmail: TextFieldForm = {
        var txt = TextFieldForm()
        txt.setarTitulo(titulo: "E-mail:")
        txt.setarTipoDoTexto(tipo: .emailAddress)
        txt.translatesAutoresizingMaskIntoConstraints = false
       return txt
    }()
    
    var campoSenha: TextFieldForm = {
        var txt = TextFieldForm()
        txt.setarTitulo(titulo: "Senha:")
        txt.translatesAutoresizingMaskIntoConstraints = false
       return txt
    }()
    
    var campoConfSenha: TextFieldForm = {
        var txt = TextFieldForm()
        txt.setarTitulo(titulo: "Confirmar Senha:")
        txt.translatesAutoresizingMaskIntoConstraints = false
       return txt
    }()
    
    var btnConfirmar: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .gray
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Corfirmar", for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gerarViews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        gerarViews()
        
    }
    
    
    func gerarViews() {
        setarSafeArea()
        gerarTitulo()
        gerarCampoNome()
        gerarCampoEmail()
        gerarCamposDeSenha()
        gerarBotao()
        
        
    }
    
    func setarSafeArea() {
        addSubview(safeArea)
        NSLayoutConstraint.activate([
            safeArea.topAnchor.constraint(equalTo: topAnchor, constant: size.height * 0.2),
            safeArea.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            safeArea.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            safeArea.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
    }
    
    func gerarTitulo() {
        safeArea.addSubview(lblTitulo)
        backgroundColor = .white
        NSLayoutConstraint.activate([
            lblTitulo.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15),
            lblTitulo.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func gerarCampoNome() {
        safeArea.addSubview(campoNome)
        NSLayoutConstraint.activate([
            campoNome.topAnchor.constraint(equalTo: lblTitulo.bottomAnchor, constant: size.height * 0.1),
            campoNome.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            campoNome.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
    }
    
    func gerarCampoEmail() {
        safeArea.addSubview(campoEmail)
        NSLayoutConstraint.activate([
            campoEmail.topAnchor.constraint(equalTo: campoNome.bottomAnchor, constant: 5),
            campoEmail.leadingAnchor.constraint(equalTo: campoNome.leadingAnchor),
            campoEmail.trailingAnchor.constraint(equalTo: campoNome.trailingAnchor)
        ])
    }
    
    func gerarCamposDeSenha() {
        safeArea.addSubview(campoSenha)
        NSLayoutConstraint.activate([
            campoSenha.topAnchor.constraint(equalTo: campoEmail.bottomAnchor, constant: 5),
            campoSenha.leadingAnchor.constraint(equalTo: campoEmail.leadingAnchor),
            campoSenha.trailingAnchor.constraint(equalTo: campoEmail.trailingAnchor)
        ])
        
        safeArea.addSubview(campoConfSenha)
        NSLayoutConstraint.activate([
            campoConfSenha.topAnchor.constraint(equalTo: campoSenha.bottomAnchor, constant: 5),
            campoConfSenha.leadingAnchor.constraint(equalTo: campoSenha.leadingAnchor),
            campoConfSenha.trailingAnchor.constraint(equalTo: campoSenha.trailingAnchor)
        ])
    }
    
    func gerarBotao() {
        safeArea.addSubview(btnConfirmar)
        NSLayoutConstraint.activate([
            btnConfirmar.topAnchor.constraint(equalTo: campoConfSenha.bottomAnchor, constant: size.height * 0.05),
            btnConfirmar.centerXAnchor.constraint(equalTo: centerXAnchor),
            btnConfirmar.widthAnchor.constraint(equalToConstant: size.width * 0.5 ),
            btnConfirmar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func senhasIguais(value: Bool) {
        if !value {
            campoConfSenha.textField.layer.borderColor = UIColor(red: 225, green: 0, blue: 0, alpha: 1).cgColor
            campoConfSenha.textField.layer.borderWidth = 2
        }else {
            campoConfSenha.textField.layer.borderWidth = 0
        }
    }
    
    func habilitarBotao(value: Bool) {
        if value { btnConfirmar.backgroundColor = .blue
            
        }else {
            btnConfirmar.backgroundColor = .gray
        }
    }
}
