//
//  OnlineBase.swift
//  CarPaxer
//
//  Created by Pontus Hilding on 08/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit
import Firebase

struct OnlineBase{

    let key : String!
    let carName : String!
    let ref : Firebase?
    let availableSeats : Int!
    let remainingSeats : Int!
    let currentUsers : [String]!
    
    init(key : String, carName : String, availableSeats : Int){
        self.key = key
        self.carName = carName
        self.ref = nil
        self.availableSeats = availableSeats
        self.remainingSeats = availableSeats
        self.currentUsers = [""]
    }
    
    init(snapshot: FDataSnapshot) {
        key = snapshot.key
        availableSeats = snapshot.value["availableSeats"] as! Int
        carName = snapshot.value["carName"] as! String
        remainingSeats = snapshot.value["remainingSeats"] as! Int
        currentUsers = snapshot.value["currentUsers"] as! [String]
        ref = snapshot.ref
    }
    
    
    func toAnyObject() -> AnyObject{
        return [
            "carName" : carName,
            "availableSeats" : availableSeats,
            "remainingSeats" : remainingSeats,
            "currentUsers" : currentUsers
        ]
    }
    
}

