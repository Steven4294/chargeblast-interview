//
//  Customer.swift
//
//
//  Created by Bruno Alves on 13/11/23.
//

import Fluent
import Vapor

final class Customer: Model, Content {
    static let schema = "customer"
    
    @ID(key: .id) var id: UUID?
    @Field(key: "name") var name: String
    @Field(key: "email") var email: String
    
    init() { }
    
    init(id: UUID? = nil, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
