import Foundation


let lines = input.components(separatedBy: .newlines).sorted()
let logs = lines.map { (line) -> (time: Int, entry: String) in
        (Int(line.string(in: 15...16))!, line.string(in: 19...))
    }

func guardId(from entry: String) -> Int {
    var id = ""
    for char in entry {
        if let _ = Int(String(char)) {
            id.append(char)
        }
    }
    return Int(id)!
}

// Dictionary keyed by guardID; values is an array of
// sleep shedulles, that is an array of 60 items, one
// for each minute, 0 is awake, 1 is asleep.
var guardSleep: [Int: [[Int]]] = [:]


var guardid: Int?
var fallsasleep = 0
var sleep = Array(repeating: 0, count: 60)

for (time, entry) in logs {
    switch entry {
    case "falls asleep":
        fallsasleep = time
    case "wakes up":
        for i in fallsasleep ..< time {
            sleep[i] = 1
        }
    default:
        if let id = guardid {
            if guardSleep.index(forKey: id) != nil {
                guardSleep[id]!.append(sleep)
            }
            else {
                guardSleep[id] = [sleep]
            }
        }
        // Setup for next guard
        sleep = Array(repeating: 0, count: 60)
        guardid = guardId(from: entry)
    }
}


// Mark: - Puzzle 1
let mostSleepingGuardID = guardSleep.mapValues {
    $0.flatMap({$0}).reduce(0, +)
}.max(by: {$0.1 < $1.1})!.key

let guardSleepByHour = guardSleep.mapValues {
        transpose(input: $0)
        .map( {$0.reduce(0, +)} )
    }

let (mostSleepingMinute, _) = guardSleepByHour[mostSleepingGuardID]!
    .enumerated()
    .max(by: {$0.1 < $1.1})!
print("Puzzle 1:", mostSleepingGuardID * mostSleepingMinute)

// Mark: - Puzzle 2
let sameSleepGuard = guardSleepByHour.max {
    $0.1.max(by: <)! < $1.1.max(by: <)!
}!
let (sameSleepMinute, _) = sameSleepGuard.value
    .enumerated()
    .max(by: {$0.1 < $1.1})!

print("Puzzle 2:", sameSleepGuard.key * sameSleepMinute)
