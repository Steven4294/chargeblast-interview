import Fluent
import Vapor

struct CustomerController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.grouped("customers").get(use: customers)
        routes.grouped("customer").post(use: create)
    }

    func customers(req: Request) async throws -> [CustomerDTO] {
        try await Customer
            .query(on: req.db)
            .all()
            .map {
                CustomerDTO(
                    name: $0.name,
                    email: $0.email
                )
            }
    }

    func create(req: Request) async throws -> CustomerDTO {
        let content = try req.content.decode(CustomerDTO.self)
        try await Customer(
            id: UUID(),
            name: content.name,
            email: content.email
        ).create(on: req.db)
        return content
    }
}
