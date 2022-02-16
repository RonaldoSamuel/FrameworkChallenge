//
//  TodoViewCell.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit

class TodoViewCell: UITableViewCell {
    
    static let identifier = "TodoViewCell"
    var topConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
            
    var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 5
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var markImage: UIImageView = {
    var imgView = UIImageView()
        imgView.image = UIImage(named: "ic_arrowDown")?.withRenderingMode(.alwaysTemplate)
        imgView.tintColor = .gray
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews() {
        backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        setupTitle()
    }
    
    func setupTitle() {
        
        contentView.addSubview(lblTitle)
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.30),
            lblTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
        
        contentView.addSubview(markImage)
        NSLayoutConstraint.activate([
            markImage.topAnchor.constraint(equalTo: lblTitle.topAnchor, constant: 0),
            markImage.leadingAnchor.constraint(equalTo: lblTitle.trailingAnchor, constant: size.width * 0.15),
            markImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            markImage.heightAnchor.constraint(equalToConstant: 25),
            markImage.bottomAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 0)
        ])
        
    }
    
    func configCell(_ data: TodoModelElement) {
        lblTitle.text = data.title
        lblTitle.textColor = .black
        markImage.image = data.completed ? UIImage(named: "ic_checked") : UIImage(named: "ic_unchecked")
        
    }

}
