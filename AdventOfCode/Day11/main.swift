func calculatePowerLevel(for cell: (x: Int, y: Int), serialNumber: Int) -> Int {
    let rackID = cell.x + 10
    let powerLevel = ((rackID * cell.y) + serialNumber) * rackID
    let hunderedDidgit = Int("\(String(powerLevel / 100).reversed().first!)")!
    return hunderedDidgit - 5
}

var grid = Array(repeating: Array(repeating: 0, count: 300), count: 300)
grid = grid.enumerated().map { row in
    row.element.enumerated().map { cell in
        calculatePowerLevel(for: (cell.offset+1, row.offset+1), serialNumber: 3999)
    }
}

// Mark: - Puzzle 1
print(grid.subMatrixSum(withSize: 3).max())

// Mark: - Puzzle 2
var max: (coord: (x: Int, y: Int), element: Int) = ((0,0),0)
var size = 0

for i in 1 ... 300 {
    let value = grid.subMatrixSum(withSize: i).max()
    if value.element > max.element {
        max = value
        size = i
    }
}

print(max, size)
