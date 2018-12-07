import Foundation


// Parse input to tuple of xy coordinates
let coordinates = input
    .components(separatedBy: .newlines)
    .map { (line) -> Point in
        let points = line.components(separatedBy: ", ")
        return Point(Int(points[0])!, Int(points[1])!)
}

// Bounds of the coordinate space
let bounds: (x: (min: Int, max: Int), y: (min: Int, max: Int)) =
 ((coordinates.map({$0.x}).min(by: <)!, coordinates.map({$0.x}).max(by: <)!),
  (coordinates.map({$0.y}).min(by: <)!, coordinates.map({$0.y}).max(by: <)!))


// Mark: - Puzzle 1
// If a coordinate is closest to at least one point on the edge of the
// coordinate space: That coordinate will be closest to an infinit number
// of points. Therefore we calculate all the points that are on the edge.
let edgePoints = (bounds.x.min ... bounds.x.max).flatMap { x in
        [Point(x, bounds.y.min), Point(x, bounds.y.max)]
    } + (bounds.y.min ... bounds.y.max).flatMap { y in
        [Point(bounds.x.min, y), Point(bounds.x.max, y)]
}

// Dictionary keyed by pointes. Suposed to contain the number of points that
// is cloosest to each coordinate.
var pointCSA = Dictionary(uniqueKeysWithValues: coordinates.map({($0, 0)}))

// Below we populate the pointCSA dictionary.
for x in bounds.x.min ... bounds.x.max {
    for y in bounds.y.min ... bounds.y.max {
        // Order all coordinated by distance to the point at (x,y)
        var ordered: [(coordinate: Point, distance: Int)] = coordinates
            .map { ($0, $0.distance(to: Point(x, y))) }
            .sorted { $0.1 < $1.1 }

        // If there are more than two point at equal distance
        // neither should count as beeing the cloosest.
        if ordered[0].distance == ordered[1].distance { continue }

        let closest = ordered.first!.coordinate

        // Increase the count of points for the closest coordinate
        pointCSA[closest]? += 1

        // If we are at an edge we remove the point from the dictionary
        if edgePoints.contains(Point(x,y)){
            pointCSA.removeValue(forKey: closest)
        }
    }
}

// The we take the max value from the dictionary
print("Puzzle 1:", pointCSA.values.max()!)

// Mark: - Puzzle 2
var pointsWithinRegion = 0

for x in bounds.x.min ... bounds.x.max {
    for y in bounds.y.min ... bounds.y.max {
        let distanceToAll = coordinates
            .map { $0.distance(to: Point(x,y)) }
            .reduce(0, +)
        if distanceToAll < 10000 {
            pointsWithinRegion += 1
        }
    }
}

print("Puzzle 2:", pointsWithinRegion)
