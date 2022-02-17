//
//  WelcomeView.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import UIKit

class WelcomeView: UIView, BaseView {
    
    var logoIcon: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: .ic_logo)
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var label: UILabel = {
        var lbl = UILabel()
        lbl.text = "Framework Challenge"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var enterButton: UIButton = {
        var btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor(red: 0.22, green: 0.17, blue: 0.45, alpha: 1.00)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("ENTRAR", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews() {
        setupBackgroundView()
        setupLogo()
        setupEnterButton()
    }
    
    func setupBackgroundView() {
        setGradientBackground(horizontal: false,
                              colorTop: UIColor(red: 0.82, green: 0.69, blue: 0.98, alpha: 1.00),
                              colorBottom: UIColor(red: 0.28, green: 0.19, blue: 0.50, alpha: 1.00))
    }
    
    func setupLogo() {
        addSubview(logoIcon)
        NSLayoutConstraint.activate([
            logoIcon.topAnchor.constraint(equalTo: topAnchor, constant: size.height*0.12),
            logoIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: size.width*0.1),
            logoIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -size.width*0.1),
            logoIcon.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: logoIcon.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupEnterButton() {
        addSubview(enterButton)
        NSLayoutConstraint.activate([
            enterButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: size.height * 0.25),
            enterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            enterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
