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

countdown(5)
