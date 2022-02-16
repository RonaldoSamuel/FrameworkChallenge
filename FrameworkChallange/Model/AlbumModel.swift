//
//  AlbumModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation

class AlbumModelElement {
    var userId: Int32
    var id: Int32
    var title: String
    
    init() {
        userId = 0
        id = 0
        title = ""
    }
    
    init(item: Album) {
        userId = item.userId
        id = item.id
        title = item.title ?? ""
    }
}
