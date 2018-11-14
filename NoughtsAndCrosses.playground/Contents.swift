import Foundation

enum BoardSquare : Int {
    case Empty = 0
    case X = 1
    case O = 2
}

class Board  {
    
    enum GameState: Int {
        case InProgress = 0
        case Draw = 1
        case WinForX = 2
        case WinForO = 3
        case Invalid = 4
    }
    
    var squares : [BoardSquare]
    
    init() {
        squares = [.Empty,.Empty,.Empty,
                    .Empty,.Empty,.Empty,
                    .Empty,.Empty,.Empty]
    }
    
    init(_ initialSquares: [BoardSquare]) {
        squares = initialSquares
    }
    
    var gameState : GameState {
        
        // count of all Xs & Os in the squares array
        let noughts = squares.filter { $0 == .X }.count
        let crosses = squares.filter { $0 == .O }.count
        
        print(noughts,crosses)
        
        //map out predefined set of wins and check against game entered.
        //Which combination of elements in the array describe different types of win eg. vertical:
        
        //If there is 4 or less its definitely in progress
        if(noughts + crosses < 4){
            return .InProgress
        }
        
        // if one move has 2 or more entries then invalid
        //if number BoardSquare with 1 >= number BoardSquare with 2, then invalid
    
        // Invalid
        if(noughts > crosses && (noughts - crosses) > 1){
            return .Invalid
        }
        
        if(crosses > noughts && (crosses - noughts) > 1){
            return .Invalid
        }
        
        
        return .InProgress
    }
    
//    var playgroundDescription: Any {
//
//        var gameText = ""
//        for (square) in squares {
//            gameText += " " + String(square.rawValue)
//        }
//        return gameText
//    }

}

//let newGame = Board()
let wonGame = Board([
                .X, .X, .X,
                .Empty,.O,.Empty,
                .O,.O,.Empty
                ])

wonGame.gameState
