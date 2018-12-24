//
//  Car.swift
//  Classes and Objects
//
//  Created by Ricardo Wiggins on 3/13/18.
//  Copyright © 2018 Ricardo Wiggins. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case HatchBack
}

class Car {
    var color = "Black"
    var numOfSeats : Int = 5
    var typeOfCar : CarType = .Coupe
    
    init(){
    }
    
    convenience init(customerChosenColor: String) {
        self.init()
        color = customerChosenColor
    }
    
    func drive() {
        print("Car is Moving")
    }
    
}
