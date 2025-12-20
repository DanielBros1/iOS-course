//
//  CategoryEntity+CoreDataProperties.swift
//  Network
//
//  Created by user279425 on 12/20/25.
//
//

public import Foundation
public import CoreData


public typealias CategoryEntityCoreDataPropertiesSet = NSSet

extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var products: NSSet?

}

// MARK: Generated accessors for products
extension CategoryEntity {

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: ProductEntity)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: ProductEntity)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)

}

extension CategoryEntity : Identifiable {

}
