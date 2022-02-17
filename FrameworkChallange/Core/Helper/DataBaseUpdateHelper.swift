//
//  DataBaseUpdateHelper.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 17/02/22.
//

import Foundation
import UIKit
import CoreData

class DataBaseUpdateHelper {
    
    static let instance = DataBaseUpdateHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func updateAlbum(item: AlbumCodable) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
        
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            
            for index in 0 ... item.count - 1 {
                let resultado = results[index] as! Album
                resultado.title = item[index].title
                resultado.userId = Int32(item[index].userID)
                
                saveContext()
            }
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func updatePost(item: PostCodable) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
        
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            
            for index in 0 ... item.count - 1 {
                let resultado = results[index] as! Post
                resultado.userId = Int32(item[index].userID)
                resultado.title = item[index].title
                
                saveContext()
            }
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func updateTodos(item: TodoCodable) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Todos")
        
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            
            for index in 0 ... item.count - 1 {
                let resultado = results[index] as! Todos
                resultado.userId = Int32(item[index].userID)
                resultado.title = item[index].title
                resultado.completed = item[index].completed
                
                
                saveContext()
            }
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            context.rollback()
        }
    }
}
