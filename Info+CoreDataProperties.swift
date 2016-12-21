//
//  Info+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Info {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Info> {
        return NSFetchRequest<Info>(entityName: "Info");
    }

    @NSManaged public var attack: Int32
    @NSManaged public var defense: Int32
    @NSManaged public var magic: Int32
    @NSManaged public var difficulty: Int32
    @NSManaged public var champion: Champion?

}
