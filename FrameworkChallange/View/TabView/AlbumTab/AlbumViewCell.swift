//
//  AlbumViewCell.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit

class AlbumViewCell: UITableViewCell {
    
    static let identifier = "AlbumViewCell"

            
    var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.015),
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.30),
            lblTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
    func configCell(_ data: AlbumModelElement, index: Int) {
        backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        if data.userId % 2 == 1 {
            backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        }
        
        lblTitle.text = "\(data.title)\n UserId: \(data.userId)"
        lblTitle.textColor = .black
    }

    
}
