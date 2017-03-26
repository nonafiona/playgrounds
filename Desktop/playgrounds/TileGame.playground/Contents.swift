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

struct Style {
    let boardBackgroundColor = #colorLiteral(red: 0.6823529412, green: 0.6235294118, blue: 0.5607843137, alpha: 1)
    let emptyTileBackgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7058823529, blue: 0.6392156863, alpha: 1)
    let tileBackgroundColors = [
        #colorLiteral(red: 0.7529411765, green: 0.7098039216, blue: 0.6509803922, alpha: 1), #colorLiteral(red: 0.9254901961, green: 0.8745098039, blue: 0.8196078431, alpha: 1), #colorLiteral(red: 0.9098039216, green: 0.8549019608, blue: 0.7490196078, alpha: 1), #colorLiteral(red: 0.9333333333, green: 0.6392156863, blue: 0.3960784314, alpha: 1),
        #colorLiteral(red: 0.9019607843, green: 0.4784313725, blue: 0.262745098, alpha: 1), #colorLiteral(red: 0.9764705882, green: 0.3843137255, blue: 0.2980392157, alpha: 1), #colorLiteral(red: 0.8901960784, green: 0.2549019608, blue: 0.1764705882, alpha: 1), #colorLiteral(red: 0.9450980392, green: 0.8235294118, blue: 0.3568627451, alpha: 1),
        #colorLiteral(red: 0.9333333333, green: 0.7921568627, blue: 0.231372549, alpha: 1), #colorLiteral(red: 0.8745098039, green: 0.7137254902, blue: 0.1333333333, alpha: 1), #colorLiteral(red: 0.9137254902, green: 0.7333333333, blue: 0.1921568627, alpha: 1), #colorLiteral(red: 0.9098039216, green: 0.737254902, blue: 0.03921568627, alpha: 1)

    ]
    let tileForegroundColors = [
        #colorLiteral(red: 0.3882352941, green: 0.3647058824, blue: 0.3176470588, alpha: 1),
        UIColor.white
    ]
    
    func tileBackgroundColor(value:Int) -> CGColor {
        return value < tileBackgroundColors.count ? tileBackgroundColors[value].cgColor : tileBackgroundColors.last!.cgColor
    }
    
    func tileForegroundColor(value:Int) -> UIColor {
        return tileForegroundColors[value > 2 ? 1 : 0]
    }
}

// MARK: Size configuration of the board - Struct 
// TODO: set tile number, tile count, board size, tile size, border size

// MARK: Tile Class

// MARK: Board Class

// MARK: GameViewController Class




