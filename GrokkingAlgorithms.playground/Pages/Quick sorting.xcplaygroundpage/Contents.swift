//: [Recursion](@previous)

import Foundation

extension Array where Element: Comparable {
    
    /// Method is used to sort array in a given order using quick sort algorithm.
    ///
    /// - Parameter ascending: Bool Sorting order flag.
    /// - Returns: Sorted array.
    func quickSort(ascending: Bool) -> [Element] {
        
        if self.count < 2 {
            return self
        }
        
        let pivotIndex = self.count / 2
        
        let pivot = self[pivotIndex]
        var lowerElementsArray = [Element]()
        var higherElementsArray = [Element]()
        
        for i in 0..<self.count {
            
            if i == pivotIndex {
                continue
            }
            
            let element = self[i]
            
            if element <= pivot {
                lowerElementsArray.append(element)
            } else {
                higherElementsArray.append(element)
            }
            
        }
        
        let sortedLowerElementsArray = lowerElementsArray.quickSort(ascending: ascending)
        let sortedHigherElementsArray = higherElementsArray.quickSort(ascending: ascending)
        
        if ascending {
            return sortedLowerElementsArray + [pivot] + sortedHigherElementsArray
        } else {
            return sortedHigherElementsArray + [pivot] + sortedLowerElementsArray
        }
        
    }
    
}

let integerArray = [1, 2, 99, 10, 10, 6, 7]
integerArray.quickSort(ascending: true)
integerArray.quickSort(ascending: false)

let oneElementArray = [2.38]
oneElementArray.quickSort(ascending: true)
