extension Array where Element == [Int] {
    func coordinated() -> [[(coord: (x: Int, y: Int), element: Int)]] {
        return self.enumerated().map { row in
            row.element.enumerated().map { cell in
                ((cell.offset+1, row.offset+1), cell.element)
            }
        }
    }

    func subMatrixSum(withSize k: Int) -> [[Int]] {
        if (k > count) { return [] }

        let size = count-k+1
        var out = Array(repeating: Array<Int>(repeating: 0, count: size), count:size)

        for i in 0 ..< size {
            for j in 0 ..< size {
                var sum = 0

                for p in i ..< k+i {
                    for q in j ..< k+j {
                        sum += self[p][q]
                    }
                }
                out[i][j] = sum
            }
        }
        return out
    }

    func max() -> (coord: (x: Int, y: Int), element: Int) {
        let coordinated = self.coordinated()
        return coordinated.map { row in
            row.max { $0.1 < $1.1 }!
            }.max { $0.1 < $1.1 }!
    }
}
