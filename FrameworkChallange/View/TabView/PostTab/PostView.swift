//
//  PostView.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit

class PostView: UIView, BaseView {
    
    var tableList: UITableView = {
        var table = UITableView()
        table.separatorInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        table.backgroundColor = .white
        table.separatorColor = .clear
        table.sectionHeaderHeight = 12
        table.tableFooterView = UIView()
        table.refreshControl = UIRefreshControl()
        table.register(PostViewCell.self, forCellReuseIdentifier: PostViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
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
        backgroundColor = .white
        setupTableView()
    }
    
    func setupTableView() {
        addSubview(tableList)
        NSLayoutConstraint.activate([
            tableList.topAnchor.constraint(equalTo: topAnchor,constant: 15),
            tableList.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            tableList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
    
}
