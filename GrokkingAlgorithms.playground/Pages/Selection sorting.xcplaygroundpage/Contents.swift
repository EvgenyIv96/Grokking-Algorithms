/*:
 [Binary search](@previous)
 */

import Foundation

extension Array where Element: Comparable {
    
    /// Method is used to sort given array in a given order.
    ///
    /// - Parameter ascending: Bool Sorting order flag.
    /// - Returns: Sorted array.
    func selectionSort(ascending: Bool) -> [Element] {
        
        var unsortedArray = self
        var sortedArray = [Element]()
        
        guard unsortedArray.count > 0 else { return unsortedArray }

        for _ in 0..<self.count {
            let smallestIndex = findSmallest(in: unsortedArray)!
            let element = unsortedArray[smallestIndex]

            if (ascending) {
                sortedArray.append(element)
            } else {
                sortedArray.insert(element, at: 0)
            }

            unsortedArray.remove(at: smallestIndex)
        }
        
        return sortedArray
        
    }
    
    /// Method is used to obtain index of smallest element in given array. If given array will be empty method returns nil.
    ///
    /// - Parameter array: Given array.
    /// - Returns: Index of smallest element in the given array. Method may return nil if given array is empty.
    private func findSmallest(in array: [Element]) -> Int? {
    
        guard var smallest = array.first else {
            return nil
        }
        
        var smallestIndex: Int = 0
        
        for element in array {
            
            if element < smallest {
                smallest = element
                smallestIndex = array.index(of: smallest)!
            }
            
        }
        
        return smallestIndex
        
    }
    
}

let intArray = [1, 7, 3, 2, 19, 5, 37, 22, 101, 77, 99]
let doubleArray = [2.9, 0.3, -27, 0.99, 55, 0.66, 111]

intArray.selectionSort(ascending: false)
intArray.selectionSort(ascending: true)

doubleArray.selectionSort(ascending: true)
doubleArray.selectionSort(ascending: false)
