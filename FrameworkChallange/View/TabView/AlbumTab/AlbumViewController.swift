//
//  AlbumViewController.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import UIKit

class AlbumViewController: UIViewController {
    
    var expandedIndexPath: NSIndexPath?
    
    var coordinator: TabCoordinator?
    var presentationView = AlbumView()
    var viewModel = AlbumViewModel()
    var disposable = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.viewModel.fetchAlbums()
        self.bindView()
        // Do any additional setup after loading the view.
    }

    func bindView() {
        
        viewModel.dataSouce.bind { value in
            if !value.isEmpty {
                self.presentationView.tableList.refreshControl?.endRefreshing()
            }
        }.disposed(by: disposable)
        
        viewModel.dataSouce
            .bind(
                to: presentationView
                    .tableList
                    .rx
                    .items(
                        cellIdentifier: AlbumViewCell.identifier,
                        cellType: AlbumViewCell.self
                    )
            ) { index, data, cell in
                cell.selectionStyle = .none

                cell.configCell(data, index: index)
            }.disposed(by: disposable)
        
        presentationView.tableList
          .rx.setDelegate(self)
          .disposed(by: disposable)
        
        presentationView.tableList.refreshControl?.rx
            .controlEvent(.valueChanged)
            .bind {
                self.viewModel.fetchAlbums()
            }.disposed(by: disposable)
    }

}

extension AlbumViewController: UITableViewDelegate {
       
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40
       }
    
}
