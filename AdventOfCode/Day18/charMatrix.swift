extension Array where Element == Character {
    func count(of: Character) -> Int {
        var c = 0
        for char in self {
            if char == of {
                c += 1
            }
        }

        return c
    }
}


extension Array where Element == [Character] {
    func neigbours(_ x: Int, _ y: Int) -> [Character] {
        var out: [Character] = []

        for i in y-1 ... y+1 {
            if i < 0 || i >= count { continue }
            for j in x-1 ... x+1 {
                if j < 0 || j >= self[i].count { continue }
                if i == y && j == x { continue }
                out.append(self[i][j])
            }

        }

        return out
    }

    func count(of char: Character) -> Int {
        return map({$0.count(of: char)}).reduce(0, +)
    }

    func matrixPrint() {
        for line in self {
            for char in line {
                print(char, separator: "", terminator: "")
            }
            print("")
        }
    }
}


