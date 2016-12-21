//
//  Imagedata+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Imagedata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Imagedata> {
        return NSFetchRequest<Imagedata>(entityName: "Imagedata");
    }

    @NSManaged public var full: String?
    @NSManaged public var sprite: String?
    @NSManaged public var group: String?
    @NSManaged public var x: Int32
    @NSManaged public var y: Int32
    @NSManaged public var h: Int32
    @NSManaged public var w: Int32
    @NSManaged public var champion: Champion?
    @NSManaged public var spells: Spells?
    @NSManaged public var passive: Passive?

}
