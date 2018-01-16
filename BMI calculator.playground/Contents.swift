//: Playground - noun: a place where people can play

import UIKit

func CalculateBMI(weight: Double, height: Double) {
    let bmi = weight / pow(height, 2)
    
    if (bmi > 25){
        print("You are overweight")
    }
    else if (bmi < 25 && bmi > 18.5){
        print ("you are normal wieght")
    }
    else if (bmi < 18.5){
        print("you are underweight")
    }
}

CalculateBMI(weight: 195, height: 1.65)
