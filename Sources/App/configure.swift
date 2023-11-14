import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(
        try .postgres(
            url: "postgresql://bsalves:GBLgRvkUH63Z@ep-black-boat-19772974-pooler.us-east-2.aws.neon.tech/test?sslmode=require"
        ),
        as: .psql
    )
    
    app.migrations.add(CreateCustomer())
    app.migrations.add(CreateProduct())
    app.migrations.add(CreateOrder())

    // register routes
    try routes(app)
}
