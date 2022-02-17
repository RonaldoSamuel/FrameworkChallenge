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
    
    func fetchAlbums() {
        self.dataSouce.accept(DataBaseFetchHelper.instance.fetchAlbums())
    }
    
    
}
