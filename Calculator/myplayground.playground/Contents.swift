//: Playground - noun: a place where people can play

import UIKit

func GetMilk(howManyMilkCartons: Int, howMuchMoneyDoIHave: Int) -> Int {
    print("Go to tge shop")
    print("buy \(howManyMilkCartons) milk cartons")
    
    let priceToPay = howManyMilkCartons * 2
    
    print ("pay $\(priceToPay) dollars")
    print("come home")
    
    let change = howMuchMoneyDoIHave - priceToPay
    
    if(priceToPay > howMuchMoneyDoIHave){
        return 0
    }
    
    return change
}

//call get milk cartons
var amountOfChange = GetMilk(howManyMilkCartons: 4, howMuchMoneyDoIHave: 10)

print("Hello master your have $\(amountOfChange) moneis left")
