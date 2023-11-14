//
//  OrderDTO.swift
//
//
//  Created by Bruno Alves on 13/11/23.
//

import Vapor

struct OrderDTO: Content {
    let id: UUID?
    let price: Float
    let currency: String
    let product: String
    let customer_email: String
}
