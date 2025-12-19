//
//  Order+CoreDataProperties.swift
//  Network
//
//  Created by user279425 on 12/19/25.
//
//

public import Foundation
public import CoreData


public typealias OrderCoreDataPropertiesSet = NSSet

extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var data: String?
    @NSManaged public var totalPrice: Double
    @NSManaged public var status: String?
    @NSManaged public var product: Product?

}

extension Order : Identifiable {

}
