import Foundation

// We have a class because we need reference
// shemantics to uppdate the overlapping propperty
class Plan {
    let id: Int
    let postion: (x: Int, y: Int)
    let size: (x: Int, y: Int)
    var opverlapping = false // Used for puzzle 2

    init(id: Int, postion: (x: Int, y: Int), size: (x: Int, y: Int)) {
        self.id = id
        self.postion = postion
        self.size = size
    }
}

// Parse the input. I know it's ugly... 
let lines = input.components(separatedBy: .newlines)
let plans = lines.map { (line: String) -> Plan in
    let parts = line.split(separator: " ")
    let id = Int(String(parts[0].dropFirst()))!

    let position = parts[2].split(separator: ",")
    let positionX = Int(position.first!)!
    let positionY = Int(position.last!.dropLast())!

    let size = parts[3].split(separator: "x")
    let sizeX = Int(size.first!)!
    let sizeY = Int(size.last!)!

    return Plan(id: id, postion: (positionX, positionY), size: (sizeX-1, sizeY-1))
}

// MARK: - Puzzle 1
var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: 1100), count: 1100)

for plan in plans {
    for x in plan.postion.x ... plan.postion.x + plan.size.x {
        for y in plan.postion.y ... plan.postion.y + plan.size.y {
            matrix[x][y] += 1
        }
    }
}
let flat = matrix.flatMap({ $0 })
let overlapping = flat.filter({ $0>=2 })
print(overlapping.count)

// MARK: - Puzzle 2
for plan in plans {
    for x in plan.postion.x ... plan.postion.x + plan.size.x {
        for y in plan.postion.y ... plan.postion.y + plan.size.y {
            if matrix[x][y] > 1 {
                plan.opverlapping = true
                break
            }
        }
    }
}

print(plans.filter({ $0.opverlapping == false}).first!.id)
