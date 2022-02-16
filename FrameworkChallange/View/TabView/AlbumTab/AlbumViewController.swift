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
        
        self.presentationView.tableList
          .rx.setDelegate(self)
          .disposed(by: disposable)
        
        self.presentationView.tableList.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
              let cell = self?.presentationView.tableList.cellForRow(at: indexPath) as? AlbumViewCell
              self?.presentationView.tableList.beginUpdates()
              self?.presentationView.tableList.endUpdates()
          }).disposed(by: disposable)
    }

}

extension AlbumViewController: UITableViewDelegate {
       
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40
       }
    
}
