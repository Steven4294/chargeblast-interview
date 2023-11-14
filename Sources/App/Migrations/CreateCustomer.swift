//
//  CreateCustomer.swift
//
//
//  Created by Bruno Alves on 13/11/23.
//

import Fluent

struct CreateCustomer: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("customer")
            .id()
            .field("name", .string, .required)
            .field("email", .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("customer").delete()
    }
}
