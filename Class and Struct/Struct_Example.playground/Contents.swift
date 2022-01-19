import Foundation

struct ChessPlayer {
    var name: String
    var victories: UInt = 0
    
    init(name:String) {
        self.name = name
    }
    
    func description(){
        print("Игрок \(name) имеет \(victories) побед")
    }
    
    mutating func addVictories (count: UInt) {
        victories += count
    }
    
}

var playerHarry = ChessPlayer(name: "Harry Potter")

var playerHelga = ChessPlayer(name: "Helga")

playerHarry.description()
playerHelga.description()

playerHarry.victories += 1
playerHelga.victories = playerHarry.victories

playerHarry.description()
playerHelga.description()

playerHarry.addVictories(count: 5)
playerHelga.addVictories(count: 10)

playerHelga.description()
playerHarry.description()







