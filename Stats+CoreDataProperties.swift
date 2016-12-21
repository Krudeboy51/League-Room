//
//  Stats+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Stats {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stats> {
        return NSFetchRequest<Stats>(entityName: "Stats");
    }

    @NSManaged public var armorperlevel: Float
    @NSManaged public var hpregenperlevel: Float
    @NSManaged public var spellblock: Float
    @NSManaged public var hpregen: Float
    @NSManaged public var attackrange: Float
    @NSManaged public var spellblockperlevel: Float
    @NSManaged public var mp: Float
    @NSManaged public var hp: Float
    @NSManaged public var armor: Float
    @NSManaged public var hpperlevel: Float
    @NSManaged public var mpregen: Float
    @NSManaged public var mpregenperlevel: Float
    @NSManaged public var movespeed: Float
    @NSManaged public var crit: Float
    @NSManaged public var attackspeedperlevel: Float
    @NSManaged public var critperlevel: Float
    @NSManaged public var attackspeedofset: Float
    @NSManaged public var attackdamageperlevel: Float
    @NSManaged public var mpperlevel: Float
    @NSManaged public var attackdamage: Float
    @NSManaged public var champion: Champion?

}
