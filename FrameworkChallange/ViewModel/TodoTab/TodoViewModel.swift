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
    
    var disposable: DisposeBag = DisposeBag()
    
    func fetchTodo() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Todos")
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            var list = [TodoModelElement]()

            for result in results {
                let resultado = result as! Todos
                list.append(TodoModelElement(item: resultado))
            }
            
            self.dataSouce.accept(list)
        }
        catch {
            print("fetch error")
        }
    }
    
}
