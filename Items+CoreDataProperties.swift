//
//  Items+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Items {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Items> {
        return NSFetchRequest<Items>(entityName: "Items");
    }

    @NSManaged public var id: Int32
    @NSManaged public var count: Int32
    @NSManaged public var block: Blocks?

}
