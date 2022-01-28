import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


let queue = DispatchQueue(label: "DispatchOwn", attributes: .concurrent)

let group = DispatchGroup()

queue.async(group: group) {
    for i in 0...10 {
        if i == 10 {
            print("i is:\(i)")
        }
    }
}

queue.async(group: group) {
    for i in 0...20 {
        if i == 20 {
            print("i is:\(i)")
        }
    }
}

group.notify(queue: .main) {
    print("Все закончено в группе : group")
}


let secondGroup = DispatchGroup()

secondGroup.enter()

queue.async(group: group) {
    for i in 0...30 {
        if i == 30 {
            print("i is:\(i)")
            sleep(2)
            secondGroup.leave()
        }
    }
}

let result = secondGroup.wait(timeout: .now() + 3)
print(result)


secondGroup.notify(queue: .main) {
    print("Все закончено в группе: secondGroup")
}

secondGroup.wait()

