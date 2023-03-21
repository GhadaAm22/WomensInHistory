//
//  Women.swift
//
//
//  Created by Ghada Amer Alshahrani on 23/08/1444 AH.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class Women:Model,Content{
    static let schema = "women"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "Name")
    var Name: String
    
    @Field(key: "DateOfBirth")
    var DateOfBirth: String
    
    @Field(key: "Age")
    var Age:Int
    
    @Field(key: "Achievements")
    var Achievements: String
    
    @Field(key: "DateOfAchieve")
    var DateOfAchieve: String
    
    @Field (key:"AgeOfAchieve")
    var AgeOfAchieve : Int
    
    
    init(){}
    
    init(id:UUID? = nil,Name:String,DateOfBirth:String,Age:Int,Achievements:String,DateOfAchieve: String,AgeOfAchieve :Int){
        self.id=id
        self.Name=Name
        self.Age=Age
        self.DateOfBirth=DateOfBirth
        self.Achievements=Achievements
        self.DateOfAchieve=DateOfAchieve
        self.AgeOfAchieve=AgeOfAchieve
    }
    
}
