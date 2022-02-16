//
//  PostViewCell.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//


import UIKit

class PostViewCell: UITableViewCell {
    
    static let identifier = "PostViewCell"
    var topConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
            
    var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 3
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var arrowImage: UIImageView = {
    var imgView = UIImageView()
        imgView.image = UIImage(named: "ic_arrowDown")?.withRenderingMode(.alwaysTemplate)
        imgView.tintColor = .black
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var lblDescription: UILabel = {
       var lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.isHidden = false
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
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.02),
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.30)
        ])
        
        contentView.addSubview(arrowImage)
        NSLayoutConstraint.activate([
            arrowImage.topAnchor.constraint(equalTo: lblTitle.topAnchor, constant: 0),
            arrowImage.leadingAnchor.constraint(equalTo: lblTitle.trailingAnchor, constant: size.width * 0.15),
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            arrowImage.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        contentView.addSubview(lblDescription)
        
        topConstraint = lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 5)
        bottomConstraint = lblDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        
        NSLayoutConstraint.activate([
            topConstraint,
            lblDescription.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblDescription.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
            bottomConstraint
        ])
    }
    
    func configCell(_ data: PostModelElement) {
        lblTitle.text = data.title
        lblTitle.textColor = .black
        lblDescription.text = data.body
    }
    
    func userClickEffect() {
        UIView.animate(withDuration:0.2, animations: {
            self.arrowImage.transform = CGAffineTransform(rotationAngle: self.topConstraint.constant == 5 ? CGFloat(179 * .pi/180.0) : 0)
                })
        if topConstraint.constant == 5 {
            makeTableViewLarger()
        } else {
            makeTableViewSmaller()
        }
    }
    
    func makeTableViewLarger() {
        lblTitle.numberOfLines = 0
        lblDescription.numberOfLines = 0
        topConstraint.constant = 10
        bottomConstraint.constant = -10
        lblDescription.isHidden = false
    }
    
    func makeTableViewSmaller() {
        lblTitle.numberOfLines = 1
        lblDescription.numberOfLines = 1
        topConstraint.constant = 5
        bottomConstraint.constant = -10
        lblDescription.isHidden = false
    }
    
}
