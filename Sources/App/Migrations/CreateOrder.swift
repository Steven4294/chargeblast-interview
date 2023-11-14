//
//  CreateOrder.swift
//
//
//  Created by Bruno Alves on 13/11/23.
//

import Fluent

struct CreateOrder: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("sell_order")
            .id()
            .field("price", .double, .required)
            .field("currency", .string, .required)
            .field("product_id", .uuid, .required, .references("product", "id"))
            .field("customer_id", .uuid, .required, .references("customer", "id"))
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("sell_order").delete()
    }
}
