//
//  Champion+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Champion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Champion> {
        return NSFetchRequest<Champion>(entityName: "Champion");
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var title: String?
    @NSManaged public var partype: String?
    @NSManaged public var lore: String?
    @NSManaged public var blurb: String?
    @NSManaged public var key: String?
    @NSManaged public var image: Imagedata?
    @NSManaged public var skins: NSSet?
    @NSManaged public var allytips: NSSet?
    @NSManaged public var enemytips: NSSet?
    @NSManaged public var tags: NSSet?
    @NSManaged public var info: Info?
    @NSManaged public var stats: Stats?
    @NSManaged public var spells: NSSet?
    @NSManaged public var passive: Passive?
    @NSManaged public var recommended: NSSet?

}

// MARK: Generated accessors for skins
extension Champion {

    @objc(addSkinsObject:)
    @NSManaged public func addToSkins(_ value: Skins)

    @objc(removeSkinsObject:)
    @NSManaged public func removeFromSkins(_ value: Skins)

    @objc(addSkins:)
    @NSManaged public func addToSkins(_ values: NSSet)

    @objc(removeSkins:)
    @NSManaged public func removeFromSkins(_ values: NSSet)

}

// MARK: Generated accessors for allytips
extension Champion {

    @objc(addAllytipsObject:)
    @NSManaged public func addToAllytips(_ value: Ally)

    @objc(removeAllytipsObject:)
    @NSManaged public func removeFromAllytips(_ value: Ally)

    @objc(addAllytips:)
    @NSManaged public func addToAllytips(_ values: NSSet)

    @objc(removeAllytips:)
    @NSManaged public func removeFromAllytips(_ values: NSSet)

}

// MARK: Generated accessors for enemytips
extension Champion {

    @objc(addEnemytipsObject:)
    @NSManaged public func addToEnemytips(_ value: Enemy)

    @objc(removeEnemytipsObject:)
    @NSManaged public func removeFromEnemytips(_ value: Enemy)

    @objc(addEnemytips:)
    @NSManaged public func addToEnemytips(_ values: NSSet)

    @objc(removeEnemytips:)
    @NSManaged public func removeFromEnemytips(_ values: NSSet)

}

// MARK: Generated accessors for tags
extension Champion {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tags)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tags)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

// MARK: Generated accessors for spells
extension Champion {

    @objc(addSpellsObject:)
    @NSManaged public func addToSpells(_ value: Spells)

    @objc(removeSpellsObject:)
    @NSManaged public func removeFromSpells(_ value: Spells)

    @objc(addSpells:)
    @NSManaged public func addToSpells(_ values: NSSet)

    @objc(removeSpells:)
    @NSManaged public func removeFromSpells(_ values: NSSet)

}

// MARK: Generated accessors for recommended
extension Champion {

    @objc(addRecommendedObject:)
    @NSManaged public func addToRecommended(_ value: Recommended)

    @objc(removeRecommendedObject:)
    @NSManaged public func removeFromRecommended(_ value: Recommended)

    @objc(addRecommended:)
    @NSManaged public func addToRecommended(_ values: NSSet)

    @objc(removeRecommended:)
    @NSManaged public func removeFromRecommended(_ values: NSSet)

}
