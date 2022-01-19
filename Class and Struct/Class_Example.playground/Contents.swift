import Foundation

class Chessman {
    
    enum ChessmanType {
        case king,castle,bishop,pawn,knight,queen
    }

    enum ChessmanColor {
        case black, white
    }
    
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String,Int)? = nil
    let figureSymbol: Character
    
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        self.figureSymbol = figure
    }
    
    init (
        type:ChessmanType,
        color:ChessmanColor,
        figureSymbol: Character,
        coordinates: (String,Int)
    ) {
        self.type = type
        self.color = color
        self.figureSymbol = figureSymbol
        setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    
    func setCoordinates(char c:String, num n:Int) {
        self.coordinates = (c,n)
    }
    
    func kill(){
        self.coordinates = nil
    }
}

var kingWhite = Chessman(type: .king, color: .white, figure: "\u{2654}")

kingWhite.setCoordinates(char: "E", num: 1)
print(kingWhite.coordinates!)

var queenBlack = Chessman(type: .queen, color: .black, figureSymbol: "\u{2655}", coordinates: ("A", 6))

