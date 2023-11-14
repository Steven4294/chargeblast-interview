import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.grouped("api").register(collection: OrderController())
    try app.grouped("api").register(collection: ProductController())
    try app.grouped("api").register(collection: CustomerController())
}
