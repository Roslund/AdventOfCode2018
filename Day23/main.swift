//let botLargestRadious = input.max {
//    $0.radious < $1.radious
//}!
//
//let inRange = input.filter { nanobot in
//    nanobot.distance(to: botLargestRadious) <= botLargestRadious.radious
//}
//
//print("puzzle 1:", inRange.count)

// TODO: Write pretty code to find min and max
let min = (x:-161365893, y: -122545332, z: -150195280)
let max = (x: 234532287, y: 101582892, z: 205344607)


print(Set(input.first!.surfacePoints()))
