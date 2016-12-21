//
//  Recommended+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Recommended {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recommended> {
        return NSFetchRequest<Recommended>(entityName: "Recommended");
    }

    @NSManaged public var champion: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var map: String?
    @NSManaged public var mode: String?
    @NSManaged public var priority: Bool
    @NSManaged public var blocks: NSSet?
    @NSManaged public var championr: Champion?

}

// MARK: Generated accessors for blocks
extension Recommended {

    @objc(addBlocksObject:)
    @NSManaged public func addToBlocks(_ value: Blocks)

    @objc(removeBlocksObject:)
    @NSManaged public func removeFromBlocks(_ value: Blocks)

    @objc(addBlocks:)
    @NSManaged public func addToBlocks(_ values: NSSet)

    @objc(removeBlocks:)
    @NSManaged public func removeFromBlocks(_ values: NSSet)

}
