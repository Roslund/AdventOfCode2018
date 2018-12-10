//
//  particle.swift
//  AdventOfCode
//
//  Created by Anton Roslund on 2018-12-10.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

struct Point {
    let x: Int
    let y: Int
}

typealias Position = Point
typealias Velocity = Point

struct Particle {
    let position: Position
    let velocity: Velocity


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
    func step() -> Particle {
        let newPosition = Position(x: position.x+velocity.x, y: position.y+velocity.y)
        return Particle(position: newPosition, velocity: velocity)
    }
}


extension Array where Element == Particle {
    func positions() -> [Position] {
        return self.map({$0.position})
    }

    func area() -> Int {
        return positions().area()
    }

    func step() -> Array<Particle> {
        return map({$0.step()})
    }
}

extension Array where Element == Position {
    func bounds() -> (x: (min: Int, max: Int), y: (min: Int, max: Int)) {
            return ((map({$0.x}).min(by: <)!, map({$0.x}).max(by: <)!),
                    (map({$0.y}).min(by: <)!, map({$0.y}).max(by: <)!))
    }

    func area() -> Int {
        let b = bounds()
        return (abs(b.x.max) + abs(b.x.min)) * (abs(b.y.max) + abs(b.x.min))
    }
}
