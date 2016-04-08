//
//  Database.swift
//  CarPaxer
//
//  Created by Pontus Hilding on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import Foundation
import UIKit

class Database{
    
    var carArray : [CarInfo]
    var userArray : [UserInfo]
    
    
    init(){
        carArray = []
        userArray = []
    }
    
    
    func addCar(newCar : CarInfo){
        carArray += [newCar]
    }
    
    func addUser(newUser : UserInfo){
        userArray += [newUser]
    }
    
    func returnLatestUser() -> UserInfo{
        return userArray.last!
    }
    
    
    
}