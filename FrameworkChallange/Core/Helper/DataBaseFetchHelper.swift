//
//  DataBaseFetchHelper.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 17/02/22.
//

import Foundation
import UIKit
import CoreData

class DataBaseFetchHelper {
    static let instance = DataBaseFetchHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchPost()-> [PostModelElement] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        var listToBeReturned = [PostModelElement]()
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            var list = [PostModelElement]()

            for result in results {
                let resultado = result as! Post
                list.append(PostModelElement(item: resultado))
            }
            
            listToBeReturned = list.sorted(by: {$0.id < $1.id})
            
        }
        catch {
            print("fetch error")
        }
        return listToBeReturned
    }
    
    func fetchAlbums() -> [AlbumModelElement] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
        var listToBeReturned = [AlbumModelElement]()
        
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            var list = [AlbumModelElement]()

            for result in results {
                let resultado = result as! Album
                list.append(AlbumModelElement(item: resultado))
            }
            listToBeReturned = list.sorted(by: { $0.userId < $1.userId })
        }
        catch {
            print("fetch error")
        }
        return listToBeReturned
    }
    
    func fetchTodo() -> [TodoModelElement] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Todos")
        var listToBeReturned = [TodoModelElement]()
        
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            var list = [TodoModelElement]()

            for result in results {
                let resultado = result as! Todos
                list.append(TodoModelElement(item: resultado))
            }
            
            listToBeReturned = list.sorted(by: { $0.id < $1.id})
        }
        catch {
            print("fetch error")
        }
        return listToBeReturned
    }
    
    
}
