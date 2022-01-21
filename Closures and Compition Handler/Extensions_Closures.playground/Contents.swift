import Foundation


//Create extension for Array, work with closures

var arr = [2,3,4,5]

// Example of non generic function

func myMap (for array : [Int], _ transform : (Int) -> Int) -> [Int] {
    var result: [Int] = []
    
    for element in array {
        result.append(transform(element))
    }
    
    return result
}

extension Array {
    
    
    // Create agile function
    
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result : [T] = []
        for element in self {
            result.append(transform(element))
        }
        return result
    }
}

let result1 = arr.myMap { s1 in
    s1 + 2
}

let result2 = arr.myMap { $0 + 2 }

let result3 = arr.myMap { $0 * $0 }

let result4 = arr.myMap { String($0) }



