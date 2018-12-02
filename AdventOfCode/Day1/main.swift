import Foundation

// Transform the puzzle input to an array of ints
let frequencyChanges = input
    .components(separatedBy: .newlines)
    .compactMap { Int($0) }

// MARK: - Puzzle 1
print(frequencyChanges.reduce(0, +))

// MARK: - Puzzle 2
var seenFrequencies: [Int] = []
var current = 0

while true {
    for input in frequencyChanges {
        current += input

        if seenFrequencies.contains(current) {
            print(current)
            exit(0)
        }
        seenFrequencies.append(current)
    }
}
