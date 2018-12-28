struct Point: Hashable {
    let x: Int
    let y: Int
    let z: Int

    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    init(_ x: Int, _ y: Int, _ z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
}

struct Sphere {
    let position: Point
    let radius: Int
}

extension Sphere {
    func distance(to other: Sphere) -> Int {
        return distance(to: other.position)
    }
    func distance(to position: Point) -> Int {
        return abs(self.position.x - position.x) +
               abs(self.position.y - position.y) +
               abs(self.position.z - position.z)
    }
}

extension Sphere {
    func surfacePoints() -> [Point] {
        var out: [Point] = []

        for z in position.z - radius ... position.z + radius {
           let offset = radius - abs(z - position.z)
            print(offset)
            for (y,x) in (position.x - offset ..< position.x + offset).enumerated() {
               out.append(Point(x,y,z))
            }
//            for (y,x) in (position.x - offset ..< position.x + radius - offset).enumerated() {
//                out.append(Point(x,y,z))
//            }
//            for (x,y) in (position.y - offset ..< position.y + radius - offset).enumerated() {
//                out.append(Point(x,y,z))
//            }
//            for (x,y) in (position.y - radius - offset ..< position.y - offset).enumerated() {
//                out.append(Point(x,y,z))
//            }
        }

        return out
    }
}
