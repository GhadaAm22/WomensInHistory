import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
    
    app.databases.use(.postgres(hostname: "localhost", username: "ghadah", password: "vapor",database:"womeninhistory"),as: .psql)
    app.migrations.add(CreateAHistory())
    
    // register routes
    try routes(app)
}
