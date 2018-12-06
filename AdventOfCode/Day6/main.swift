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
// If a point is closes to the bounds, the points closest
// to it is infinit, since the problem is ounbound.
// First we collect the coordinates that contain infinit points
let edgePoints = (bounds.x.min ... bounds.x.max).flatMap { x in
    [Point(x, bounds.y.min), Point(x, bounds.y.max)]
    } + (bounds.y.min ... bounds.y.max).flatMap { y in
        [Point(bounds.x.min, y), Point(bounds.x.max, y)]
}

// Create a dictionary keyed by pointes
// containing the number of points that
// is losest to each point.
var pointCSA = Dictionary(uniqueKeysWithValues: coordinates.map({($0, 0)}))

// Populate the dictionary
for x in bounds.x.min ... bounds.x.max {
    for y in bounds.y.min ... bounds.y.max {
        var closest: [Point] = []
        var closestDistance = Int.max

        for coordinate in coordinates {
            let distance = Point(x, y).distance(to: coordinate)
            if distance < closestDistance {
                closestDistance = distance
                closest = [coordinate]
            } else if distance == closestDistance {
                closest.append(coordinate)
            }
        }

        if closest.count == 1 {
            // First we check if we are an edge point
            // If so we remove it from teh dictionary
            if edgePoints.contains(Point(x,y)){
                pointCSA.removeValue(forKey: closest.first!)
            } else {
                pointCSA[closest.first!]? += 1
            }
        }
    }
}

// The we take the max value from the dictionary
print(pointCSA.max(by: { a, b in a.value < b.value })!)

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

print(pointsWithinRegion)
