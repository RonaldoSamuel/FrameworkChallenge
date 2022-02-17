//
//  TodoViewModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import UIKit
import CoreData

class TodoViewModel {
    var dataSouce: BehaviorRelay<[TodoModelElement]> = BehaviorRelay<[TodoModelElement]>(value: [])
    
    func fetchTodo() {
        self.dataSouce.accept(DataBaseFetchHelper.instance.fetchTodo())
    }
    
}
