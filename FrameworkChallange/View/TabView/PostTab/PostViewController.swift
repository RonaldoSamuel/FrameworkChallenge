//
//  PostViewController.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//


import UIKit

class PostViewController: UIViewController {
    
    var expandedIndexPath: NSIndexPath?
    
    var coordinator: TabCoordinator?
    var presentationView = PostView()
    var viewModel = PostViewModel()
    var disposable = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.fetchPost()
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
                        cellIdentifier: PostViewCell.identifier,
                        cellType: PostViewCell.self
                    )
            ) { _, data, cell in
                cell.selectionStyle = .none

                cell.configCell(data)
            }.disposed(by: disposable)
        
        self.presentationView.tableList.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
              let cell = self?.presentationView.tableList.cellForRow(at: indexPath) as? PostViewCell
              self?.presentationView.tableList.beginUpdates()
              cell?.heightAnchor.constraint(equalToConstant: 10)
              cell?.userClickEffect()
              self?.presentationView.tableList.endUpdates()
          }).disposed(by: disposable)
    }

}
