//
//  AlbumView.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit

class AlbumView: UIView, BaseView {
    
    var tableList: UITableView = {
        var table = UITableView()
        table.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        table.backgroundColor = .white
        table.separatorColor = .gray
        table.tableFooterView = UIView()
        table.refreshControl = UIRefreshControl()
        table.register(AlbumViewCell.self, forCellReuseIdentifier: AlbumViewCell.identifier)
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
            tableList.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableList.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
