//
//  PostViewModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import UIKit
import CoreData

class PostViewModel {
    
    var dataSouce: BehaviorRelay<[PostModelElement]> = BehaviorRelay<[PostModelElement]>(value: [])
    
    var disposable: DisposeBag = DisposeBag()
    
    func fetchPost() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            var list = [PostModelElement]()

            for result in results {
                let resultado = result as! Post
                list.append(PostModelElement(item: resultado))
            }
            
            self.dataSouce.accept(list)
        }
        catch {
            print("fetch error")
        }
    }
    
}
