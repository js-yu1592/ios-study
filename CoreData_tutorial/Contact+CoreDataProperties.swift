//
//  Contact+CoreDataProperties.swift
//  CoreData_tutorial
//
//  Created by 유준상 on 2021/02/01.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var shortcutNumber: Int16

}

extension Contact : Identifiable {

}
