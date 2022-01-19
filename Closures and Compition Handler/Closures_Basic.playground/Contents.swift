import Foundation

let birthday: (String) -> () = { name in
    print("Happy birthday, \(name)")
}

birthday("Bob")

/*
let closureName: (ParameterTypes) -> ReturnType = {(parameterName:ParameterType) in
    ...
}
*/

let findMaxNumber: (Int,Int) -> (Int) = {(number1: Int, number2: Int) ->(Int) in
    return number1 > number2 ? number1 : number2
}

let maxNumber = findMaxNumber(10,20)

let numbers = [11, 5, 42, 99, 65, 70, 22]


// MARK: - Type intarface

let sortedNumbers1 = numbers.sorted { (s1:Int, s2:Int) -> Bool in
    return s1 < s2
}

let sortedNumbers2 = numbers.sorted { s1, s2 in
    return s1 < s2
}

let sortedNumbers3 = numbers.sorted { s1, s2 in
    s1 < s2
}

let sortedNumbers4 = numbers.sorted { $0 < $1 }

let sortedNumbers5 = numbers.sorted(by: <)

// MARK: - Capture and The Capture List


func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    let runningTotal = 0
    
    let incrementer: () -> Int = {
        return runningTotal + amount
    }
    return incrementer
}

let incrementByTwenty = makeIncrementer(forIncrement: 20)
print(incrementByTwenty())



// MARK: - Let's understand with help an example

/*
 If you assign a closure to a property of a class instance, and the closure captures that instance by referring to the instance or its members, you will create a strong reference cycle between the closure and the instance. Swift uses capture lists to break these strong reference cycles. For more information, see Strong Reference Cycles for Closures.
 */

class Database {
    var data = 0
    
    deinit {
        print("Bye")
    }
}

var database = Database()
database.data = 11010101

let calculate = { [weak database] multiplier in
    return database!.data * multiplier
    
}

let result = calculate(2)



/*
 Here’s what happens in the code:
 First, you define a class Database. It has one property data. It’s a fictional class, so imagine that it’s super memory intensive…
 Then, you create an instance of Database, assign it to database, and set its data property to some integer value.
 Then, you define a closure calculate. The closure takes one argument multiplier, and it captures database. Within the closure, the data is simply multiplied by multiplier.
 Finally, the closure is called with an argument 2 and its result is assigned to result.
 */
