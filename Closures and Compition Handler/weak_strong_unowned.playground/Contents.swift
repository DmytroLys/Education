import Foundation

//Example of Strong capturing

class Singer {
    
    func playSong() {
        print("Shake it off!!")
    }
    
}

func sing () -> () -> Void {

    let teylor = Singer()

    let singing = {
        teylor.playSong()
        return

    }
    return singing
}

let singFunction = sing()
singFunction()

// Example of weak capturing

func singWeak () -> () -> Void {
    
    let teylor = Singer()
    
    let singing = { [weak teylor] in
        teylor?.playSong
        return
        
    }
    return singing
}

let singFunctionWeak = singWeak()
singFunctionWeak()

//Example unowned capturing

func singUnonwed() -> () -> Void {
    let taylor = Singer()

    let singing = { [unowned taylor] in
        taylor.playSong()
        return
    }

    return singing
}

let singFunctionUnowned = singUnonwed()
//singFunctionUnowned()


class House {
    var ownerDetails : ( ()-> Void )?
    
    func printDetails() {
        print("This is great house")
    }
    
    deinit {
        print("I'm being demolished")
    }
}

class Owner {
    var houseDetails : ( ()-> Void )?
    
    func printDetails() {
        print("I'm own a house")
    }
    
    deinit {
        print("I'm dying!")
    }
}

/*
//В результате будут выведены сообщения: “Creating a house and an owner”, “I’m dying!”, “I'm being demolished!”, затем “Done” – всё работает, как надо.
 
print("Creating house and an owner")

do {
    let house = House()
    let owner = Owner()
}

print("Done")

*/


/*
 
// Теперь создадим цикл сильных ссылок.Теперь появятся сообщения “Creating a house and an owner”, затем “Done”. Деинициалайзеры не будут вызваны.


print("Creating house and an owner")

do {
    
    let house = House()
    let owner = Owner()
    
    house.ownerDetails = owner.printDetails
    owner.houseDetails = house.printDetails
}

print("Done")

*/


print("Creating house and an owner")

do {
    
    let house = House()
    let owner = Owner()
    
    house.ownerDetails = { [weak owner] in owner?.printDetails() }
    owner.houseDetails =  { [weak house] in house?.printDetails() }
    
}

print("Done")
