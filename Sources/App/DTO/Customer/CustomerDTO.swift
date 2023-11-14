//
//  CustomerDTO.swift
//
//
//  Created by Bruno Alves on 14/11/23.
//

import Vapor

struct CustomerDTO: Content {
    var id: UUID?
    var name: String
    var email: String
}
