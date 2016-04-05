//
//  CarInfo.swift
//  CarPaxer
//
//  Created by Pontus Hilding on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class CarInfo{
    
    
    var carOwner: String
    var availableSeats: Int
    var remainingSeats: Int
    var listOfUsers: [String]
    
    init(carOwner: String, availableSeats: Int, remainingSeats: Int, listOfUsers: [String]){
        self.carOwner = carOwner
        self.availableSeats = availableSeats
        self.remainingSeats = remainingSeats
        self.listOfUsers = listOfUsers
        
        
    }
    
}