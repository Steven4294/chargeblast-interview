//
//  Product.swift
//
//
//  Created by Bruno Alves on 13/11/23.
//

import Fluent
import Vapor

final class Product: Model, Content {
    static let schema = "product"
    
    @ID(key: .id) var id: UUID?
    @Field(key: "name") var name: String
    
    init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
