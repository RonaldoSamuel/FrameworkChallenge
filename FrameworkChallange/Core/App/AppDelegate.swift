//
//  AppDelegate.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?
    var disposable = DisposeBag()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        // MARK: Networking
        NetworkReachability.shared.startNetworkMonitoring()
        
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
                    self.coordinator?.start()
                },
                onError: { error in
                    print(error)
                }
            ).disposed(by: disposable)
        
        return true
    }
    
    func createAlbums(item: AlbumCodable) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Album", in: context)
        
        for value in item {
            let newAlbum = AlbumS(entity: entity!, insertInto: context)
            
            newAlbum.id = Int32(value.id)
            newAlbum.title = value.title
            newAlbum.userId = Int32(value.userID)
        }
        
        saveContext()
    }
    
    func createPosts(item: PostCodable) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Post", in: context)
        
        for value in item {
            let newPost = PostS(entity: entity!, insertInto: context)
            
            newPost.id = Int32(value.id)
            newPost.title = value.title
            newPost.userId = Int32(value.userID)
            newPost.body = value.body
          
        }
        
        saveContext()
    }
    
    func createTodos(item: TodoCodable) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Todos", in: context)
        
        for value in item {
            let newTodo = TodoS(entity: entity!, insertInto: context)
            
            newTodo.id = Int32(value.id)
            newTodo.userId = Int32(value.userID)
            newTodo.title = value.title
            newTodo.completed = value.completed
        }
        
        saveContext()
    }
    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "FrameworkChallange")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

enum JsonType {
    case post, album, todos, `default`
}
