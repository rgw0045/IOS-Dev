//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Ricardo Wiggins on 3/14/18.
//  Copyright © 2018 Ricardo Wiggins. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    var destination : String?
    
    override func drive() {
        super.drive()
        
        //custom capabilities
        if let userSetDestination = destination {
            print("towards " + userSetDestination)
        }
    }
}
