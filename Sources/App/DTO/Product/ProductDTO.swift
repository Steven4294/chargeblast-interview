//
//  ProductDTO.swift
//
//
//  Created by Bruno Alves on 14/11/23.
//

import Vapor

struct ProductDTO: Content {
    var id: UUID?
    var name: String
}
