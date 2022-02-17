//
//  PostViewModel.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import UIKit
import CoreData

class PostViewModel {
    var dataSouce: BehaviorRelay<[PostModelElement]> = BehaviorRelay<[PostModelElement]>(value: [])
    
    func fetchPost() {
        dataSouce.accept(DataBaseFetchHelper.instance.fetchPost())
    }
    
}
