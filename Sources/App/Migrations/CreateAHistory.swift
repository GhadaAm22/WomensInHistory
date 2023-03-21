//
//  CreateAHistory.swift
//  
//
//  Created by Ghada Amer Alshahrani on 23/08/1444 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateAHistory:Migration{
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("women")
            .id()
            .field("Name", .string)
            .field("Age", .int)
            .field("DateOfBirth", .string)
            .field("Achievements",.string)
            .field("DateOfAchieve", .string)
            .field("AgeOfAchieve",.int)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("women").delete()
        
    }
    
    
}
