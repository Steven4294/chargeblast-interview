//
//  Order.swift
//
//
//  Created by Bruno Alves on 13/11/23.
//

import Fluent
import Vapor

final class Order: Model, Content {
    
    static let schema = "sell_order"
    
    @ID(key: .id) var id: UUID?
    @Field(key: "price") var price: Double
    @Field(key: "currency") var currency: String
    @Parent(key: "product_id") var product: Product
    @Parent(key: "customer_id") var customer: Customer
    
    init() { }
    
    init(
        id: UUID = UUID(),
        price: Double,
        currency: String,
        product_id: Product.IDValue,
        customer_id: Customer.IDValue
    ) {
        self.id = id
        self.price = price
        self.currency = currency
        self.$product.id = product_id
        self.$customer.id = customer_id
    }
}

