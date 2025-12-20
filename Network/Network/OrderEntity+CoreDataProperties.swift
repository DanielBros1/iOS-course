//
//  OrderEntity+CoreDataProperties.swift
//  Network
//
//  Created by user279425 on 12/20/25.
//
//

public import Foundation
public import CoreData


public typealias OrderEntityCoreDataPropertiesSet = NSSet

extension OrderEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderEntity> {
        return NSFetchRequest<OrderEntity>(entityName: "OrderEntity")
    }

    @NSManaged public var data: String?
    @NSManaged public var id: Int64
    @NSManaged public var status: String?
    @NSManaged public var totalPrice: Double
    @NSManaged public var product: ProductEntity?

}

extension OrderEntity : Identifiable {

}
