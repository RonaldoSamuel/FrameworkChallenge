//
//  JsonClient.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation

class JsonClient: APIClient {
    static func getPosts() -> Observable<PostCodable> {
        return request(JsonRouter.post)
    }
    
    static func getAlbums() -> Observable<AlbumCodable> {
        return request(JsonRouter.album)
    }
    
    static func getTodos() -> Observable<TodoCodable> {
        return request(JsonRouter.todo)
    }
}
