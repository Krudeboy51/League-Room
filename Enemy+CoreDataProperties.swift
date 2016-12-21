//
//  Enemy+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Enemy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Enemy> {
        return NSFetchRequest<Enemy>(entityName: "Enemy");
    }

    @NSManaged public var info: String?
    @NSManaged public var champion: Champion?

}
