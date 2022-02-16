//
//  PostModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation

class PostModelElement {
    var userId: Int32
    var id: Int32
    var title: String
    var body: String
    
    init() {
        userId = 0
        id = 0
        title = ""
        body = ""
    }
    
    init(item: Post) {
        userId = item.userId
        id = item.id
        title = item.title ?? ""
        body = item.body ?? ""
    }
}
