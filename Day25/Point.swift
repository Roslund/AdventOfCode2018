struct Point: Equatable, Hashable {
    let w: Int
    let x: Int
    let y: Int
    let z: Int

    init(_ w: Int, _ x: Int, _ y: Int, _ z: Int) {
        self.w = w
        self.x = x
        self.y = y
        self.z = z
    }
}

extension Point {
    func distance(to other: Point) -> Int {
        let absW = abs(w - other.w)
        let absX = abs(x - other.x)
        let absY = abs(y - other.y)
        let absZ = abs(z - other.z)
        return absW + absX + absY + absZ
    }
}
