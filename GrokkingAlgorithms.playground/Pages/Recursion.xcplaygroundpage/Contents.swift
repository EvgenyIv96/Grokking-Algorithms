//: [Selection sorting](@previous)
import Foundation

/// Function is used to perfrorm countdown in console from given integer value to zero.
///
/// - Parameter point: Initial integer value.
func countdown(_ point: Int) {
    
    print(point)
    
    if point > 0 {
        countdown(point-1)
    } else {
        print("Finish!")
    }
    
}

/// Function is used to calculate factorial for given integer value.
///
/// - Parameter value: Integer value which is used to calculate factorial for.
/// - Returns: Factorial for given value.
func factorial(_ value: Int) -> Int {
    
    if value == 1 {
        return value
    } else {
        return value*factorial(value-1)
    }
    
}

/*:
 # Упражнения
 
 **4.1** Напишите код для функции sum (см. выше).
 */

/// Function is used to find sum of all numeric values in given array.
///
/// - Parameter array: Numbers array.
/// - Returns: Sum value.
func sum<T: Numeric>(_ array: [T]) -> T {
    
    if let element = array.first {
        var tail = array
        tail.remove(at: 0)
        return element + sum(tail)
    } else {
        return 0
    }
    
}

/*:
 **4.2** Напишите рекурсивную функцию для подсчета элементов в списке.
 */

/// Function is used to calculate elements count in the given array.
///
/// - Parameter array: Given array.
/// - Returns: Count of elements in given array.
func count(_ array: [Any]) -> Int {
    
    if let _ = array.first {
        var tail = array
        tail.remove(at: 0)
        return 1 + count(tail)
    } else {
        return 0
    }
    
}

/*:
 **4.3** Найдите наибольшее число в списке.
 */

/// Function is used to find biggest value in given numeric array. If given array will be empty function returns nil.
///
/// - Parameter array: Numeric array.
/// - Returns: Biggest value in given array.
func findBiggest<T: Comparable>(_ array: [T])  -> T? {
    
    if let element = array.first {
        var tail = array
        tail.remove(at: 0)
        
        guard let biggestInTail = findBiggest(tail) else { return element }
        
        return element > biggestInTail ? element : biggestInTail
        
    } else {
        return nil
    }
    
}

/*:
 **4.4** Помните бинарный поиск из главы 1? Он тоже относится к классу алгоритмов •разделяй и властвуй•. Сможете ли вы определить базовый и рекурсивный случай для бинарного поиска?
 
 **Ответ:** Базовый случай - Массив из одного элемента. Если он совпадает с искомым - элемент найден, в противном случае - в массиве нет искомого элемента.
 Рекурсивный случай - Половина исходного массива для которого дальше следует проводить бинарный поиск.
 */

countdown(5)
factorial(5)
sum([1, 2, 3])
count([])
count([1])
count(["hello", "bye", "1233", "555"])
findBiggest([1, 11, 3, 5, 3, 8])
