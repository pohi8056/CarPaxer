//
//  UserInfo.swift
//  CarPaxer
//
//  Created by Pontus Hilding on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class UserInfo{


    var name: String
    var hasCar: Bool
    var hasReservedSeat: Bool
    var car: CarInfo
    
    init(name: String, hasCar: Bool, hasReservedSeat: Bool, car: CarInfo){
        self.name = name
        self.hasCar = hasCar
        self.hasReservedSeat = false
        self.car = car
    }
    
}