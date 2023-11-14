import Fluent
import Vapor

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.grouped("products").get(use: products)
        routes.grouped("product").post(use: create)
    }

    func products(req: Request) async throws -> [ProductDTO] {
        try await Product
            .query(on: req.db)
            .all()
            .map {
                ProductDTO(
                    id: $0.id,
                    name: $0.name
                )
            }
    }

    func create(req: Request) async throws -> ProductDTO {
        let content = try req.content.decode(ProductDTO.self)
        let product = try await Product(
            id: UUID(),
            name: content.name
        ).create(on: req.db)
        return content
    }
}
