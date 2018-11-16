import Foundation

enum BoardSquare : Int {
    
    case Empty = 0
    case X = 1
    case O = 20
    
    var description : String {
        switch self {
            case .Empty: return "_"
            case .X: return "X"
            case .O : return "O"
        }
    }
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
        
        squares = Array(repeating: .Empty, count: 9)

    }
    
    init(_ initialSquares: [BoardSquare]) {
        squares = initialSquares
    }
    
    // for reference
    let numberedBoard = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
    ]
    
    let winningCombinations = [
        //horizontal
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        //vertical
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        //diagonal
        [0, 4, 8], [2, 4, 6]
    ]
    
    func sumSquares(in range: Range<Int>) -> Int {
        
        return squares[range].reduce(0){
            (Result, BoardSquare) in
            return Result + BoardSquare.rawValue
        }
        
    }
    
    var gameState : GameState {
        
        
        // count of all Xs & Os in the squares array
        let noughts = squares.filter { $0 == .X }.count
        let crosses = squares.filter { $0 == .O }.count

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
        
        let cross: BoardSquare = .X
        let crossWinSum = cross.rawValue * 3
        
        let nought: BoardSquare = .O
        let noughtWinSum = nought.rawValue * 3
        
        var CrossesHaveWon = false
        var NoughtsHaveWon = false
        for combinationTriplet in winningCombinations {
            
            if(CrossesHaveWon && NoughtsHaveWon){ break }
            
            let summedTriplet = squares[combinationTriplet[0]].rawValue + squares[combinationTriplet[1]].rawValue + squares[combinationTriplet[2]].rawValue
            
            
            if(summedTriplet == crossWinSum){
                CrossesHaveWon = true
            }
            
            if(summedTriplet == noughtWinSum){
                NoughtsHaveWon = true
            }
            
        }
        
        if(CrossesHaveWon && NoughtsHaveWon){
            return .Invalid
        }
        
        if(CrossesHaveWon){
            return .WinForX
        }
        
        if(NoughtsHaveWon){
            return .WinForO
        }
        
        return .InProgress
    }
    
    var playgroundDescription: Any {
        
        var gameText = ""
        
        for (index, square) in squares.enumerated() {
            
            gameText += " " + String(square.description) + " "
            if(index % 3 == 2){
                gameText += "\n"
            }
        }

        return gameText
    }

}

//let emptyGame = Board()
let wonGame = Board([
                .Empty, .O, .X,
                .Empty,.X,.Empty,
                .X,.Empty,.O
                ])

wonGame.gameState
