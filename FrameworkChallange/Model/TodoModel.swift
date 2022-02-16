//
//  TodoModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation

class TodoModelElement {
    var userId: Int32
    var id: Int32
    var title: String
    var completed: Bool
    
    init() {
        userId = 0
        id = 0
        title = ""
        completed = false
    }
    
    init(item: Todos) {
        userId = item.userId
        id = item.id
        title = item.title ?? ""
        completed = item.completed
    }
}
