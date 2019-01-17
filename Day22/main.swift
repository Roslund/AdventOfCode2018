let depth = 6084
let target = (x: 14, y: 709)

var errosion =  Array(repeating: Array(repeating: 0, count: target.y+1), count: target.x+1)

for x in 0 ... target.x {
    for y in 0 ... target.y {
        if x == 0 {
            errosion[x][y] = 48271 * y
        } else if y == 0 {
            errosion[x][y] = 16807 * x
        } else {
            errosion[x][y] = errosion[x-1][y] * errosion[x][y-1]
        }

        errosion[x][y] = ((errosion[x][y] + depth) % 20183)
    }
}

errosion[target.x][target.y] = (depth % 20183) % 3

// Part 1
print(errosion.flatMap({$0.map({$0 % 3})}).reduce(0, +))
