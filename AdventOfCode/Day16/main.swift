let samples = parseInput(input)

// Mark: - Puzzle 1
let alternatives = samples.map {sample in
    sample.possibleOPs().count
}
print(alternatives.filter({ $0 >= 3}).count)

// Mark: - Puzzle 2
let ops: [(Int, [[String]])] = (0 ... 15).map({ ($0, []) })
var possibleOPs = Dictionary(uniqueKeysWithValues: ops)

for sample in samples {
    possibleOPs[sample.op]!.append(sample.possibleOPs())
}

// Remove duplicates
let withoutDuplicates = possibleOPs.mapValues { value in
    Array(Set(value.flatMap { $0 }))
}

// Find which op codes belong to what operations
for (key, value) in solve(input: withoutDuplicates).sorted(by: { $0.1 < $1.1}) {
    print("\(value): \(key)")
}



