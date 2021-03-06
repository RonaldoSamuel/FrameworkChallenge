//
//  MainTabViewController.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    var disposable: DisposeBag = DisposeBag()
    var coordinator: TabCoordinator?
    var mainViewControllers = [UIViewController]()
    
    let blurEffect = UIBlurEffect(style: .dark)
    var blurVisualEffectView: UIVisualEffectView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        tabBar.isTranslucent = true
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
        
        mainViewControllers.removeAll()
        
        let albumView = AlbumViewController()
        albumView.coordinator = coordinator
        let albumImg = UIImage(named: .ic_albums)
        let albumItem = UITabBarItem(title: "lblTabAlbum".translate, image: albumImg, tag: 1)
        albumView.tabBarItem = albumItem
        
        let todosView = TodoViewController()
        todosView.coordinator = coordinator
        let todosImg = UIImage(named: .ic_todos)
        let todosItem = UITabBarItem(title: "lblTabToDo".translate, image: todosImg, tag: 1)
        todosView.tabBarItem = todosItem
        
        let postView = PostViewController()
        postView.coordinator = coordinator
        let postImg = UIImage(named: .ic_posts)
        let postItem = UITabBarItem(title: "lblTabPost".translate, image: postImg, tag: 1)
        postView.tabBarItem = postItem
        
        
        mainViewControllers.append(postView)
        mainViewControllers.append(albumView)
        mainViewControllers.append(todosView)
        
        viewControllers = mainViewControllers.map { UINavigationController(rootViewController: $0)}

    }
}
