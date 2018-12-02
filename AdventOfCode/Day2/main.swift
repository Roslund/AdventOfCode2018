import Foundation

let words = input.components(separatedBy: .newlines)

//MARK: - Puzzle 1
var twos = 0
var threes = 0

for word in words {
    // Make dictionary with letters and the times they occur in the word
    let letterOccurrences = Dictionary(grouping: word, by: { $0 }).mapValues { $0.count }

    if letterOccurrences.values.contains(2) { twos += 1 }
    if letterOccurrences.values.contains(3) { threes += 1 }
}

print(twos * threes)

//Mark: - Puzzle 2
for word in words {
    for word2 in words {
        if word.oneCharDifferent(to: word2)
        {
            print(String(zip(word, word2).compactMap { $0 == $1 ? $0 : nil }))
            exit(0)
        }
    }
}

