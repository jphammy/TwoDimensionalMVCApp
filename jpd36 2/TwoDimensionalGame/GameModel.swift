// Jonathan Pham
// Intro to iOS Summer 2019
// Project 2

import Foundation

enum Direction {
    case north, east, west, south
}

struct Coordinate {
    let x: Int
    let y: Int
}

struct Location {
    let x, y: Int
    let allowedDirections: [Direction]
    var event: String?
}

struct Row {
    let locations: [Location]
}

class GameModel {
    private var grid = [Row]()
    private var currentRowIndex = 2     // start at (x: 0, y: 0)
    private var currentLocationIndex = 2
    var numberOfMoves = 0
    
    private let minXYvalue = -2
    private let maxXYvalue = 2
    
    init() {
        self.grid = createGameGrid()
    }
}

extension GameModel {
    func restart() {
        currentRowIndex = 2
        currentLocationIndex = 2
        numberOfMoves = 0 // Set number of moves to 0
    }
    func currentLocation() -> Location {
        let yCoordinate = currentRowIndex - 2
        let xCoordinate = currentLocationIndex - 2
        let coordinate = Coordinate(x: xCoordinate, y: yCoordinate)
        let allowedDirections: [Direction] = [.north, .east, .west, .south]
        let event:String? = nil
        
        return Location(x: xCoordinate, y: yCoordinate,
                        allowedDirections: allowedDirectionss(x: xCoordinate, y: yCoordinate), event: event)
    }
    func move(direction: Direction) {
        switch direction {
        case .north:
            currentRowIndex += 1
        case .south:
            currentRowIndex -= 1
        case .east:
            currentLocationIndex += 1
        case .west:
            currentLocationIndex -= 1
        }
        numberOfMoves += 1 // Count number of moves
    }
}

// MARK: - Helper methods for creating grid
extension GameModel {
    private func createGameGrid() -> [Row] {
        let possibleXYValues = Array(minXYvalue...maxXYvalue)
        var gameGrid = [Row]()
        for yValue in minXYvalue...maxXYvalue {
            var locations = [Location]()
            for xValue in minXYvalue...maxXYvalue {
                let directions = allowedDirectionss(x: xValue, y: yValue)
                let location = Location(x: xValue, y: yValue, allowedDirections: directions, event: nil)
                locations.append(location)
            }
            let gameRow = Row(locations: locations)
            gameGrid.append(gameRow)
        }
        return gameGrid
    }
    private func allowedDirectionss(x: Int, y: Int) -> [Direction] {
        var directions = [Direction]()
        switch y {
        case minXYvalue:
            directions += [.north]
        case maxXYvalue:
            directions += [.south]
        default:
            directions += [.north, .south]
        }
        switch x {
        case minXYvalue:
            directions += [.east]
        case maxXYvalue:
            directions += [.west]
        default:
            directions += [.east, .west]
        }
        return directions
    }
    
    private func event (x: Int, y: Int) -> String? {
        if(x == 2 && y == 2){
            print("ROFLCOPTER")
            return "LOLOL"
        }
        else if(x == -2 && y == -2){
            print("ROFLCOPTER")
            return "LOLOL"
        }
        else{
            return nil
        }
    }
}





