//
//  Track.swift
//  AdventOfCode
//
//  Created by Anton Roslund on 2018-12-13.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

struct Track {
    let track: [[Character]]
    var carts: [Cart]
}

extension Track {
    init(from input: String) {
        let lines = input.components(separatedBy: .newlines)
        var track: [[Character]] = []
        var carts: [Cart] = []

        for (y, line) in lines.enumerated() {
            var row: [Character] = []

            for (x, char) in line.enumerated() {
                switch char {
                case ">":
                    row.append("-")
                    carts.append(Cart(position: (x,y), direction: .east))
                case "<":
                    row.append("-")
                    carts.append(Cart(position: (x,y), direction: .west))
                case "^":
                    row.append("|")
                    carts.append(Cart(position: (x,y), direction: .north))
                case "v":
                    row.append("|")
                    carts.append(Cart(position: (x,y), direction: .south))
                default:
                    row.append(char)
                }
            }
            track.append(row)
        }

        self.track = track
        self.carts = carts
    }
}

extension Track: CustomStringConvertible {
    var description: String {
        var out: String = ""
        for (y, line) in track.enumerated() {
            for (x, char) in line.enumerated() {
                let cart = carts.filter { cart in
                    cart.position.x == x && cart.position.y == y
                }

                if let cart = cart.first {
                    out.append(cart.direction.rawValue)
                } else {
                    out.append(char)
                }
            }
            out.append("\n")
        }

        return out
    }
}

extension Track {
    mutating func step() -> (x: Int, y: Int)? {
        var crachposition: (x: Int, y: Int)? = nil
        let carts = self.carts.sorted{ c1, c2 in
            c1.position.y * track.count + c1.position.x <
            c2.position.y * track.count + c2.position.x
        }

        // Move one step forward
        for cart in carts {
            switch cart.direction {
            case .north:
                cart.position.y -= 1
            case .east:
                cart.position.x += 1
            case .south:
                cart.position.y += 1
            case .west:
                cart.position.x -= 1
            }

            let (x, y) = cart.position

            // Reorient
            switch track[y][x] {
            case "/":
                switch cart.direction {
                case .north:
                    cart.direction = .east
                case .east:
                    cart.direction = .north
                case .south:
                    cart.direction = .west
                case .west:
                    cart.direction = .south
                }
            case "\\":
                switch cart.direction {
                case .north:
                    cart.direction = .west
                case .east:
                    cart.direction = .south
                case .south:
                    cart.direction = .east
                case .west:
                    cart.direction = .north
                }
            case "+":
                switch cart.nextdecition {
                case .left:
                    cart.turnLeft()
                    cart.nextdecition = .straight
                case .straight:
                    cart.nextdecition = .right
                case .right:
                    cart.turnRight()
                    cart.nextdecition = .left
                }
            default:
                break
            }

            // Check for craches
            let cartsAtPosition = carts.filter {
                cart in cart.position == (x,y)
            }

            if cartsAtPosition.count > 1 {
                for cart in cartsAtPosition {
                    self.carts.removeAll(where: { $0 === cart})
                }
                crachposition = cartsAtPosition.first?.position
            }
        }
        return crachposition
    }
}

func nothing() {
    return ()
}
