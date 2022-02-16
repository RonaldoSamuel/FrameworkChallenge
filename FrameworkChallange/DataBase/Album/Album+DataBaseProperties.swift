//
//  Album+DataBaseProperties.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation
import CoreData

extension AlbumS {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlbumS> {
        return NSFetchRequest<AlbumS>(entityName: "Album")
    }

    @NSManaged public var userId: Int32
    @NSManaged public var id: Int32
    @NSManaged public var title: String?

}

extension AlbumS : Identifiable {

}
