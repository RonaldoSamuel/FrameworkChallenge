//
//  TodoViewController.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit

class TodoViewController: UIViewController {
    
    var expandedIndexPath: NSIndexPath?
    
    var coordinator: TabCoordinator?
    var presentationView = TodoView()
    var viewModel = TodoViewModel()
    var disposable = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.viewModel.fetchTodo()
        self.bindView()
    }

    func bindView() {
        viewModel.dataSouce
            .bind(
                to: presentationView
                    .tableList
                    .rx
                    .items(
                        cellIdentifier: TodoViewCell.identifier,
                        cellType: TodoViewCell.self
                    )
            ) { _, data, cell in
                cell.selectionStyle = .none

                cell.configCell(data)
            }.disposed(by: disposable)
        
        self.presentationView.tableList.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
              let cell = self?.presentationView.tableList.cellForRow(at: indexPath) as? TodoViewCell
              self?.presentationView.tableList.beginUpdates()
              self?.presentationView.tableList.endUpdates()
          }).disposed(by: disposable)
    }

}
