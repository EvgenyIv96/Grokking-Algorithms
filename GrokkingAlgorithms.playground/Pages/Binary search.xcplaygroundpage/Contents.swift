import Foundation
import PlaygroundSupport

/// Function is used to determine index of given value in a given array. If there isn't given value in the given array function return nil.
///
/// - Parameters:
///   - value: Given value
///   - array: Given array
/// - Returns: Index of given value in the given array. May be nil if there insn't given value in the given array.
func findIndex<Item>(of value: Item, in array: [Item]) -> Int?
    where Item: Comparable {
    
    let count =  array.count
    
    var lowIndex = 0
    var highIndex = count - 1
    
    while lowIndex <= highIndex {
        
        let middleIndex = (lowIndex+highIndex)/2
        let middleValue: Item = array[middleIndex]
        
        if middleValue == value {
            return middleIndex
        } else if middleValue < value {
            lowIndex = middleIndex + 1
        } else if middleValue > value {
            highIndex = middleIndex - 1
        }
        
    }
    
    return nil
    
}

let numbers = [1, 3, 5, 7, 11]
let strings = ["a", "b", "c", "z"]

findIndex(of: 3, in: numbers)
findIndex(of: 1, in: numbers)
findIndex(of: 11, in: numbers)
findIndex(of: 99, in: numbers)
findIndex(of: 4, in: numbers)

findIndex(of: "a", in: strings)
findIndex(of: "z", in: strings)
findIndex(of: "c", in: strings)
findIndex(of: "y", in: strings)

/*:
 # Упражнения:
 
 
 **1.1** Имеется отсортированный список из 128 имен, и вы ищете в нем зна­ чение методом бинарного поиска. Какое максимальное количество проверок для этого может потребоваться?
 
 Бинарный поиск имеет логарифмическую сложность. log128 = 7.
 
 **Ответ:** 7.
 
 **1.2** Предположим, размер списка увеличился вдвое. Как изменится мак­симальное количество проверок?
 
 log(128*2) = 8.
 
 **Ответ:** Увеличится на одну проверку.
 
 [Selection sorting](@next)
 
 */
