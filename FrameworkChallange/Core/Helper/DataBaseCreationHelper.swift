//
//  DataBaseHelper.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 17/02/22.
//

import Foundation
import UIKit
import CoreData

class DataBaseCreationHelper {
    let disposable: DisposeBag = DisposeBag()
    
    static let instance = DataBaseCreationHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func callApis() {
        JsonClient.getAlbums()
            .asObservable()
            .subscribe(
                onNext: {
                    result in
                    self.createAlbums(item: result)
                },
                onError: { error in
                    print(error)
                }
            ).disposed(by: disposable)
        
        JsonClient.getPosts()
            .asObservable()
            .subscribe(
                onNext: {
                    result in
                    self.createPosts(item: result)
                },
                onError: { error in
                    print(error)
                }
            ).disposed(by: disposable)
        
        JsonClient.getTodos()
            .asObservable()
            .subscribe(
                onNext: {
                    result in
                    self.createTodos(item: result)
                },
                onError: { error in
                    print(error)
                }
            ).disposed(by: disposable)
    }
    
    func createAlbums(item: AlbumCodable) {
        let entity = NSEntityDescription.entity(forEntityName: "Album", in: context)
        
        for value in item {
            let newAlbum = AlbumS(entity: entity!, insertInto: context)
            newAlbum.id = Int32(value.id)
            newAlbum.title = value.title
            newAlbum.userId = Int32(value.userID)
        }
        
        if !saveContext() {
            DataBaseUpdateHelper.instance.updateAlbum(item: item)
        }
    }
    
    func createPosts(item: PostCodable) {
        let entity = NSEntityDescription.entity(forEntityName: "Post", in: context)
        
        for value in item {
            let newPost = PostS(entity: entity!, insertInto: context)
            newPost.id = Int32(value.id)
            newPost.title = value.title
            newPost.userId = Int32(value.userID)
            newPost.body = value.body
            
        }
        
        if !saveContext() {
            DataBaseUpdateHelper.instance.updatePost(item: item)
        }
    }
    
    func createTodos(item: TodoCodable) {
        let entity = NSEntityDescription.entity(forEntityName: "Todos", in: context)
        
        for value in item {
            let newTodo = TodoS(entity: entity!, insertInto: context)
            newTodo.id = Int32(value.id)
            newTodo.userId = Int32(value.userID)
            newTodo.title = value.title
            newTodo.completed = value.completed
        }
        
        if !saveContext() {
            DataBaseUpdateHelper.instance.updateTodos(item: item)
        }
    }
    
    func saveContext() -> Bool {
        do {
            try context.save()
            return true
        } catch {
            context.rollback()
            return false
        }
    }
    
}
