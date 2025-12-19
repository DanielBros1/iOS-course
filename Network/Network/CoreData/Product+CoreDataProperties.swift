//
//  Product+CoreDataProperties.swift
//  Network
//
//  Created by user279425 on 12/19/25.
//
//

public import Foundation
public import CoreData


public typealias ProductCoreDataPropertiesSet = NSSet

extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var category: Category?
    @NSManaged public var orders: NSSet?

}

// MARK: Generated accessors for orders
extension Product {

    @objc(addOrdersObject:)
    @NSManaged public func addToOrders(_ value: Product)

    @objc(removeOrdersObject:)
    @NSManaged public func removeFromOrders(_ value: Product)

    @objc(addOrders:)
    @NSManaged public func addToOrders(_ values: NSSet)

    @objc(removeOrders:)
    @NSManaged public func removeFromOrders(_ values: NSSet)

}

extension Product : Identifiable {

}
