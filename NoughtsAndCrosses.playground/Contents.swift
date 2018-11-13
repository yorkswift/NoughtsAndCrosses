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
        
        
        //map out predefined set of wins and check against game entered.
        //Which combination of elements in the array describe different tyoes of win eg. vertical:
        
        //If there is 4 or less counters its definitely
        // if one move has 2 or more entries then invalid
        //if number BoardSquare with 1 >= number BoardSquare with 2, then invalid
    
        // Invalid
        // get me the count of all Xs in the squares array
        let xCount = squares.filter { $0 == .X }.count
        let yCount = squares.filter { $0 == .O }.count
        
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
                .O,.Empty,.Empty
                ])
wonGame.gameState
