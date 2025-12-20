//
//  ProductEntity+CoreDataProperties.swift
//  Network
//
//  Created by user279425 on 12/20/25.
//
//

public import Foundation
public import CoreData


public typealias ProductEntityCoreDataPropertiesSet = NSSet

extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var category: CategoryEntity?
    @NSManaged public var orders: NSSet?

}

// MARK: Generated accessors for orders
extension ProductEntity {

    @objc(addOrdersObject:)
    @NSManaged public func addToOrders(_ value: ProductEntity)

    @objc(removeOrdersObject:)
    @NSManaged public func removeFromOrders(_ value: ProductEntity)

    @objc(addOrders:)
    @NSManaged public func addToOrders(_ values: NSSet)

    @objc(removeOrders:)
    @NSManaged public func removeFromOrders(_ values: NSSet)

}

extension ProductEntity : Identifiable {

}
