//
//  TextFieldForm.swift
//  FrameworkChallange
//
//  Created by Ronaldo Aparecido - Framework Digital on 13/06/23.
//

import Foundation
import UIKit

class TextFieldForm: UIView {
    
    var tituloLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = ""
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var textField: UITextField = {
        var txt = UITextField()
        txt.backgroundColor = .gray
        txt.layer.cornerRadius = 10
        txt.autocapitalizationType = .none
        txt.autocorrectionType = .no
        txt.translatesAutoresizingMaskIntoConstraints = false
      return txt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gerarCampos()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        gerarCampos()
    }
    
    func setarTitulo(titulo: String) {
        tituloLabel.text = titulo
    }
    
    func setarTipoDoTexto(tipo: UIKeyboardType) {
        self.textField.keyboardType = tipo
    }
    
    func gerarCampos() {
        addSubview(tituloLabel)
        NSLayoutConstraint.activate([
            tituloLabel.topAnchor.constraint(equalTo: topAnchor),
            tituloLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor,constant: 4),
            textField.leadingAnchor.constraint(equalTo: tituloLabel.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
