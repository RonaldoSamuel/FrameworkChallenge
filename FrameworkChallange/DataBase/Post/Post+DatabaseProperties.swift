//
//  Post+DatabaseProperties.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import CoreData

extension PostS {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostS> {
        return NSFetchRequest<PostS>(entityName: "Post")
    }

    @NSManaged public var userId: Int32
    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension PostS : Identifiable {

}
