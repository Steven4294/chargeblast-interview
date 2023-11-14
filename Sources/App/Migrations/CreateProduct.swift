//
//  CreateProduct.swift
//
//
//  Created by Bruno Alves on 13/11/23.
//

import Fluent

struct CreateProduct: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("product")
            .id()
            .field("name", .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("product").delete()
    }
}
