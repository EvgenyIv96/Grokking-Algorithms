//: [Selection sorting](@previous)
import Foundation

func countdown(_ point: Int) {
    
    print(point)
    
    if point > 0 {
        countdown(point-1)
    } else {
        print("Finish!")
    }
    
}

func factorial(_ value: Int) -> Int {
    
    if value == 1 {
        return value
    } else {
        return value*factorial(value-1)
    }
    
}

countdown(5)
factorial(5)
