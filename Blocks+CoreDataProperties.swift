//
//  Blocks+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Blocks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Blocks> {
        return NSFetchRequest<Blocks>(entityName: "Blocks");
    }

    @NSManaged public var type: String?
    @NSManaged public var recommended: Recommended?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Blocks {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: Items)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: Items)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
