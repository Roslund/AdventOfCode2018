//let graph = UnweightedGraph(vertices: input)
//
//var others = input
//for point in graph {
//    for other in others {
//        if point == other { continue }
//        if point.distance(to: other) <= 3 {
//            graph.addEdge(from: point, to: other)
//        }
//    }
//    others.removeAll(where: { $0 == point})
//}
//
//var points = input
//var constilations = Set<Set<Point>>()
//
//for point in points {
//    if let neighbors = graph.neighborsForVertex(point)
//    {
//        constilations.insert(Set(neighbors))
//    }
//
//}
//
//let numberOfConstilations = constilations.filter {
//    $0.count >= 2
//}.count
//
//print(numberOfConstilations)

// 932, too high
// Not 599, 589

//var constellations: [[Point]] = []
//
//let points = input
//for point in points {
//    var single = true
//
//    for other in points {
//        if point == other { continue }
//
//        if point.distance(to: other) <= 3 {
//            if let otherIndex = constellations.firstIndex(where: { constellation in
//                constellation.contains(other)
//            }) {
//                constellations[otherIndex].append(point)
//            } else {
//                constellations.append([point, other])
//            }
//
//            single = false
//            break
//        }
//    }
//
//    if single {
//        constellations.append([point])
//    }
//}
//
//print(constellations.count)

let points = input
var constellations: [Point: Set<Point>] = [:]

for point in points {
    constellations[point] = [point]
}

for point in points {
    for other in points {
        if point.distance(to: other) <= 3 {
            constellations[other]! = constellations[other]!.union(constellations[point]!)
            constellations[point] = constellations[other]
        }
    }
}


print(Set(constellations.values).count)

