//
//  Album+CoreDataProperties.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//
//

import Foundation
import CoreData


extension Album {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
        return NSFetchRequest<Album>(entityName: "Album")
    }

    @NSManaged public var userId: Int32
    @NSManaged public var id: Int32
    @NSManaged public var title: String?

}

extension Album : Identifiable {

}
