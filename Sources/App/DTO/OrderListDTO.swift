//
//  OrderListDTO.swift
//
//
//  Created by Bruno Alves on 13/11/23.
//

import Vapor

struct OrderListDTO: Content {
    var order: [OrderDTO]
}
