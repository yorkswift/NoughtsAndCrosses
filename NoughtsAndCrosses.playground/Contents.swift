import UIKit

enum BoardSquare : Int {
    case Empty = 0
    case X = 1
    case O = 2
}

class Board : CustomPlaygroundDisplayConvertible {
    
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
    
    public var gameState : GameState {
        return .InProgress
    }
    
    var playgroundDescription: Any {
        
        var gameText = ""
        for (square) in squares {
            gameText += " " + String(square.rawValue)
        }
        return gameText
    }

}

let newGame = Board()

newGame.gameState

let wonGame = Board([
                .X, .X, .X,
                .Empty,.O,.Empty,
                .O,.Empty,.Empty
                ])
