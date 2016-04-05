//
//  UserInfo.swift
//  CarPaxer
//
//  Created by Pontus Hilding on 06/04/16.
//  Copyright © 2016 PonyCorp Inc. All rights reserved.
//

import UIKit

class UserInfo{
    
    var hasCar: Bool
    var hasReservedSeat: Bool
    var car: CarInfo
    
    init(hasCar: Bool, hasReservedSeat: Bool, car: CarInfo){
        self.hasCar = hasCar
        self.hasReservedSeat = false
        self.car = car
    }
    
}