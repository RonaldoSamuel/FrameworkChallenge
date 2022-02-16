//
//  AlbumViewModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import UIKit
import CoreData

class AlbumViewModel {
    
    var dataSouce: BehaviorRelay<[AlbumModelElement]> = BehaviorRelay<[AlbumModelElement]>(value: [])
    
    var disposable: DisposeBag = DisposeBag()
    
    func fetchAlbums() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            var list = [AlbumModelElement]()

            for result in results {
                let resultado = result as! Album
                list.append(AlbumModelElement(item: resultado))
            }
            
           let listSorted = list.sorted(by: { $0.userId < $1.userId })
            
            self.dataSouce.accept(listSorted)
        }
        catch {
            print("fetch error")
        }
    }
    
}
