import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.grouped("api").register(collection: OrderController())
}
