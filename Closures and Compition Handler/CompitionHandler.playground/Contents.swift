import Foundation

/*
 First, let's create a closure block whose type is (Int) -> (). When you pass Int as total, it will print a total.
 */

let block : (Int) -> Void = { total in
    print("Sum of the first 1000 number is \(total)")
}

func sumOfFirstThousandNumber (completionHandler: (Int) -> Void) {
    var total = 0
    
    for i in 1...1000{
        total = total + i
    }
    
    completionHandler(total)
}

sumOfFirstThousandNumber(completionHandler: block)

var myCompletionHandler : (Bool) -> Void =  { doneWorking in
    
    if doneWorking {
        print("Work is done")
    }
}

func doSomething(using completionHandler:(Bool) -> Void) {
    
    sleep(2)
    print("Stage 1 passed...")
    sleep(2)
    print("Stage 2 passed...")
    sleep(2)
    print("Stage 3 passed...")
    
    completionHandler(true)
}

doSomething(using: myCompletionHandler)






