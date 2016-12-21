//
//  Skins+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Skins {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Skins> {
        return NSFetchRequest<Skins>(entityName: "Skins");
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var num: Int32
    @NSManaged public var champion: Champion?

}
