import Foundation

let dependencies = input
    .components(separatedBy: .newlines)
    .map { line in
        return (line.char(at: 36), line.char(at: 5))
}

// MARK: - Puzzle 1
// Create a dictionary with capital letters as keys and empty arrays as values
var dick: [String: [String]] = Dictionary(uniqueKeysWithValues:
    (65 ... 90).map { (String(UnicodeScalar($0)), []) }
)


dependencies.forEach { step, dependancy in
    dick[step]?.append(dependancy)
}

print("Puzzle 1: ", terminator: "")

while true {
    if dick.isEmpty { break }

    let step = dick.filter({ $1.isEmpty }).keys.sorted().first!
    print(step, terminator: "")

    dick.removeValue(forKey: step)
    dick = Dictionary(uniqueKeysWithValues: dick.map { key, value in
        (key, value.filter({ $0 != step }))
    })
}
print("")


// MARK: - Puzzle 2
func timeRequired(for step: String) -> Int {
    return Int(step.unicodeScalars.first!.value) - 64 + 60
}

// Readd everything again
dick = Dictionary(uniqueKeysWithValues:
    (65 ... 90).map { (String(UnicodeScalar($0)), []) }
)

dependencies.forEach { step, dependancy in
    dick[step]?.append(dependancy)
}

class WorkOrder {
    let step : String
    var timeRemaining: Int

    init(step: String, timeRemaining: Int) {
        self.step = step
        self.timeRemaining = timeRemaining
    }
}

var workers: [WorkOrder?] = [nil, nil, nil, nil, nil]
var time = 0

while true {
    var availableWorkOrders = dick
        .filter({ $1.isEmpty })
        .keys
        .filter({ step in
            let stepsInProgress = workers
                .compactMap { $0 }
                .map { order in
                    order.step
            }
            return !stepsInProgress.contains(step)
        })
        .sorted()
        .map { step in
            WorkOrder(step: step, timeRemaining: timeRequired(for: step))
    }

    if availableWorkOrders.isEmpty && dick.isEmpty { break }

    // Assign available work to workers
    for i in 0 ..< workers.count {
        if !availableWorkOrders.isEmpty && workers[i] == nil {
            workers[i] = availableWorkOrders.removeFirst()
        }

    }

    let shortest = workers
        .compactMap({$0})
        .min {$0.timeRemaining < $1.timeRemaining }!

    time += shortest.timeRemaining

    // set worker of shortest workOrder to nil
    workers = workers.map { workOrder in
        workOrder?.step == shortest.step ? nil : workOrder
    }

    workers.forEach { workOrder in
        workOrder?.timeRemaining -= shortest.timeRemaining
    }


    dick.removeValue(forKey: shortest.step)


    dick = Dictionary(uniqueKeysWithValues: dick.map { key, value in
        (key, value.filter({ $0 != shortest.step }))
    })
}

print("Puzzle 2:", time)

