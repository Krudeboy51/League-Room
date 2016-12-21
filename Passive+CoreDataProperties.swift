//
//  Passive+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Passive {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Passive> {
        return NSFetchRequest<Passive>(entityName: "Passive");
    }

    @NSManaged public var name: String?
    @NSManaged public var descriptionValue: String?
    @NSManaged public var champion: Champion?
    @NSManaged public var image: Imagedata?

}
