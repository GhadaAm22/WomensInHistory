import Fluent
import Vapor

struct WomenController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let women = routes.grouped("women")
        women.get(use: index)
        women.post(use: create)
        women.get(":id", use: getid(req:))
        women.group(":id") { womeninhistory in
            womeninhistory.delete(use: delete)
        }
        women.group(":id") { womeninhistory in
            womeninhistory.put(use: update)
        }
//        women.group(":id") {womeninhistory in
//            womeninhistory.get( use: getid)}
    }
    
    
    func index(req: Request) throws -> EventLoopFuture<[Women]> {
        return Women.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<Women> {
        let womeninhistory = try req.content.decode(Women.self)
        return womeninhistory.save(on: req.db).map{ womeninhistory }
        
    }
    func getid(req: Request)  async throws -> Women {
        guard let womeninhistory = try await Women.find(req.parameters.get(":id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return womeninhistory
    }
    
    
    
    func delete(req: Request) throws ->EventLoopFuture<HTTPStatus> {
        return Women.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{ $0.delete(on: req.db)}
            .transform(to: .ok)
    }
    
    func update(req:Request) throws -> EventLoopFuture<Women> {
        
        let input = try req.content.decode(Women.self)
        
        return Women.find(req.parameters.get("id"),on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { women in
                women.Name = input.Name
                women.Age = input.Age
                women.DateOfBirth = input.DateOfBirth
                women.Achievements = input.Achievements
                women.DateOfAchieve = input.DateOfAchieve
                women.AgeOfAchieve = input.AgeOfAchieve
                
                return women.update(on: req.db).map{Women(id: women.id,Name :women.Name,DateOfBirth: women.DateOfBirth, Age: women.Age, Achievements: women.Achievements , DateOfAchieve:women.DateOfAchieve , AgeOfAchieve: women.AgeOfAchieve )}
            }
    }
    
}


