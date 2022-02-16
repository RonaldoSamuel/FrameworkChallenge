//
//  Todos+CoreDataProperties.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//
//

import Foundation
import CoreData


extension TodoS {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todos> {
        return NSFetchRequest<Todos>(entityName: "Todos")
    }

    @NSManaged public var userId: Int32
    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var completed: Bool

}

extension Todos : Identifiable {

}
