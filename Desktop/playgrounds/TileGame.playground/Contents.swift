// What are you making? 

// A 2048 clone that's probably cooler. 
// ( but everyone says that 😏 )

// MARK: Libraries

import UIKit
import PlaygroundSupport
import GameplayKit

// MARK: Movement orientation 
// enum with vertical & horizontal cases

enum Orientation {
    case vertical
    case horizontal
}

// MARK: Movement direction 
// enum with backward & forward

enum Direction: Int {
    case forward =  1
    case backward = -1
}

// MARK: Position of the tile on the board - Struct
// for finding the previous position based on switch statement for orientation
struct Position: Equatable {
    let x : Int
    let y : Int
    
    func previousPosition(direction:Direction, orientation:Orientation) -> Position {
        switch orientation {
        case .vertical:
            return Position(x: x, y: y - direction.rawValue)
        case .horizontal:
            return Position(x: x - direction.rawValue, y: y)
            
        }
    }
}

func ==(lhs: Position, rhs: Position) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

// MARK: Style configuration of the game - Struct
// TODO: set tile foreground & background styles in arrays & manipulate them through functions
// TODO: initialize the style of an empty board background & foreground colors

// MARK: Size configuration of the board - Struct 
// TODO: set tile number, tile count, board size, tile size, border size

// MARK: Tile Class

// MARK: Board Class

// MARK: GameViewController Class




