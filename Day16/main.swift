let samples = parseInput(input)

// Mark: - Puzzle 1
let alternatives = samples.map {sample in
    sample.possibleOPs().count
}
print("Puzzle 1:", alternatives.filter({ $0 >= 3}).count)

// Mark: - Puzzle 2
let ops = (0 ... 15).map({ ($0, Operation.all) })
var possibleOPs = Dictionary(uniqueKeysWithValues: ops)

for sample in samples {
    possibleOPs[sample.op]!.removeAll { operation in
        !sample.possibleOPs().contains(operation)
    }
}

// Find which op codes belong to what operations
for (key, value) in backtrack(input: possibleOPs).sorted(by: { $0.1 < $1.1}) {
    print("\(value) = \(key)")
}

// Parse the program input
let instructions = programInput
    .components(separatedBy: .newlines)
    .map { line in
        line.split(separator: " ").map { number in
            Int(number)!
        }
}

// Execute the program
var program = Program(instructions)
program.execute()
print("Puzzle 2:", program.regristers[0])
