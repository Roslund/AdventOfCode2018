func solve(input: [Int: [String]]) -> [Int: String] {
    var input = input
    var out: [Int: String] = [:]

    while !input.isEmpty {
        for (key, value) in input {
            if value.count == 1 {
                out[key] = value.first!
                input.remove(at: input.index(forKey: key)!)
                input = input.mapValues { operations in
                    operations.filter { operation in
                        operation != value.first!
                    }
                }
            }
        }
    }

    return out
}
