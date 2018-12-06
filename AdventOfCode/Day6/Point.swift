struct Point: Hashable {
    let x: Int
    let y: Int

    init(_ x:Int, _ y: Int) {
        self.x = x
        self.y = y
    }

    /// Returns the manhattan distance to an other point
    func distance(to other: Point) -> Int {
        return abs(self.x - other.x) + abs(self.y - other.y)
    }
}
