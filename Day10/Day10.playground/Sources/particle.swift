//
//  particle.swift
//  AdventOfCode
//
//  Created by Anton Roslund on 2018-12-10.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation
import UIKit

public struct Point {
    public let x: Int
    public let y: Int
}

public typealias Position = Point
public typealias Velocity = Point

public struct Particle {
    public let position: Position
    public let velocity: Velocity


    init(position: Position, velocity: Velocity) {
        self.position = position
        self.velocity = velocity
    }

    // Initializer because i don't want to reformat the input again
    init(position: (x: Int, y: Int), velocity: (x: Int, y: Int)) {
        self.position = Position(x: position.x, y: position.y)
        self.velocity = Velocity(x: velocity.x, y: velocity.y)
    }
}

extension Particle {
    public func step() -> Particle {
        let newPosition = Position(x: position.x+velocity.x, y: position.y+velocity.y)
        return Particle(position: newPosition, velocity: velocity)
    }
}


extension Array where Element == Particle {
    public func positions() -> [Position] {
        return self.map({$0.position})
    }

    public func area() -> Int {
        return positions().area()
    }

    public func step() -> Array<Particle> {
        return map({$0.step()})
    }

    public func step(times: Int) -> Array<Particle> {
        var state = self

        for _ in 0 ..< times {
            state = state.step()
        }
        return state
    }
}

extension Array where Element == Position {
    public func bounds() -> (x: (min: Int, max: Int), y: (min: Int, max: Int)) {
            return ((map({$0.x}).min(by: <)!, map({$0.x}).max(by: <)!),
                    (map({$0.y}).min(by: <)!, map({$0.y}).max(by: <)!))
    }

    public func area() -> Int {
        let b = bounds()
        return (abs(b.x.max) + abs(b.x.min)) * (abs(b.y.max) + abs(b.x.min))
    }
}

extension Array where Element == Particle {
    public func toUIView() -> UIView {
        let bounds = positions().bounds()

        let grid = UIView(frame: CGRect(x: 0, y: 0,
                                        width: bounds.x.max - bounds.x.min,
                                        height: bounds.y.max - bounds.y.min))

        for particle in self {
            let pixel = UIView(frame: CGRect(x: particle.position.x - bounds.x.min, y: particle.position.y - bounds.y.min, width: 1, height: 1))
            pixel.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            grid.addSubview(pixel)
        }
        return grid
    }
}
