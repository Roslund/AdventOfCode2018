enum Direction: Character {
    case north = "^"
    case east = ">"
    case south = "v"
    case west = "<"
}

class Cart {
    var position: (x: Int, y: Int)
    var direction: Direction
    var nextdecition = NextDecition.left


    init(position: (x: Int, y: Int), direction: Direction) {
        self.position = position
        self.direction = direction
    }
}

enum NextDecition {
    case left
    case straight
    case right
}
extension Cart {
    func turnLeft() {
        switch direction {
        case .north:
            direction = .west
        case .east:
            direction = .north
        case .south:
            direction = .east
        case .west:
            direction = .south
        }
    }
    func turnRight() {
        switch direction {
        case .north:
            direction = .east
        case .east:
            direction = .south
        case .south:
            direction = .west
        case .west:
            direction = .north
        }
    }
}
