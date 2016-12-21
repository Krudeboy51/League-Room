//
//  Spells+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Spells {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Spells> {
        return NSFetchRequest<Spells>(entityName: "Spells");
    }

    @NSManaged public var name: String?
    @NSManaged public var descriptionValue: String?
    @NSManaged public var costtype: String?
    @NSManaged public var key: String?
    @NSManaged public var champion: Champion?
    @NSManaged public var image: Imagedata?

}
