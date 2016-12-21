//
//  DatabaseVersions+CoreDataProperties.swift
//  
//
//  Created by Krudeboy51 on 12/16/16.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension DatabaseVersions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DatabaseVersions> {
        return NSFetchRequest<DatabaseVersions>(entityName: "DatabaseVersions");
    }

    @NSManaged public var dbname: String?
    @NSManaged public var dbversion: String?

}
