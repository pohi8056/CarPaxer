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
    //var car: CarInfo
    
    init(name: String){
        self.name = name
        hasCar = false
        hasReservedSeat = false
        //self.car = car
    }
    
    func returnName() -> String{
        return name
    }
}