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
    var listOfUsers: [UserInfo]
    
    init(carOwner: String, availableSeats: Int){
        self.carOwner = carOwner
        self.availableSeats = availableSeats
        self.remainingSeats = availableSeats
        self.listOfUsers = []
    }
    
    init(){
        self.carOwner = ""
        self.availableSeats = 0
        self.remainingSeats = 0
        self.listOfUsers = []
    }
  
    
}