import Fluent
import Vapor

struct OrderController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.grouped("orders").get(use: orders)
        routes.grouped("order").post(use: create)
        routes.grouped("find").grouped("orders").post(use: findOrders)
    }

    func orders(req: Request) async throws -> OrderListDTO {
        OrderListDTO(
            orders: try await Order
                .query(on: req.db)
                .with(\.$customer)
                .with(\.$product)
                .all()
                .map {
                    OrderDTO(
                        id: $0.id,
                        price: $0.price,
                        currency: $0.currency,
                        product: $0.product.name,
                        customer_email: $0.customer.email
                    )
                }
        )
    }

    func create(req: Request) async throws -> OrderDetailDTO {
        let content = try req.content.decode(OrderDetailDTO.self)
        guard let product = try await Product.query(on: req.db).filter(\.$name == content.order.product).first()?.id else {
            throw Abort(.custom(code: 404, reasonPhrase: "Product not found"))
        }
        guard let customer = try await Customer.query(on: req.db).filter(\.$email == content.order.customer_email).first()?.id else {
            throw Abort(.custom(code: 404, reasonPhrase: "Customer not found"))
        }
        try await Order(
            price: content.order.price,
            currency: content.order.currency,
            product_id: product,
            customer_id: customer
        ).create(on: req.db)
        return content
    }

    func findOrders(req: Request) async throws -> OrderListDTO {
        let content = try req.content.decode(FindOrderDTO.self)
        guard let product = try await Product.query(on: req.db).filter(\.$name == content.name).first()?.id else {
            throw Abort(.custom(code: 404, reasonPhrase: "Product not found."))
        }
        return OrderListDTO(
            orders: try await Order
                .query(on: req.db)
                .with(\.$customer)
                .with(\.$product)
                .filter(\.$product.$id == product)
                .all()
                .map {
                    OrderDTO(
                        id: $0.id,
                        price: $0.price,
                        currency: $0.currency,
                        product: $0.product.name,
                        customer_email: $0.customer.email
                    )
                }
        )
    }
}
