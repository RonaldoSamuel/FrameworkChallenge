//
//  Post+CoreDataProperties.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var userId: Int32
    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension Post : Identifiable {

}
