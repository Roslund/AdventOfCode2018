
struct Program {
    var regristers: [Int] = [0,0,0,0]
    let instructions: [[Int]]

    init(_ instructions: [[Int]]) {
        self.instructions = instructions
    }

}

extension Program {
    mutating func execute() {
        for instruction in instructions {
            let op = instruction[0]
            let a = instruction[1]
            let b = instruction[2]
            let c = instruction[3]

            switch Operation(rawValue: op)! {
            case .addr:
                regristers[c] = regristers[a] + regristers[b]
            case .addi:
                regristers[c] = regristers[a] + b
            case .mulr:
                regristers[c] = regristers[a] * regristers[b]
            case .muli:
                regristers[c] = regristers[a] * b
            case .banr:
                regristers[c] = regristers[a] & regristers[b]
            case .bani:
                regristers[c] = regristers[a] & b
            case .borr:
                regristers[c] = regristers[a] | regristers[b]
            case .bori:
                regristers[c] = regristers[a] | b
            case .setr:
                regristers[c] = regristers[a]
            case .seti:
                regristers[c] = a
            case .gtir:
                regristers[c] = (a > regristers[b]) ? 1 : 0
            case .gtri:
                regristers[c] = (regristers[a] > b) ? 1 : 0
            case .gtrr:
                regristers[c] = (regristers[a] > regristers[b]) ? 1 : 0
            case .eqir:
                regristers[c] = (a == regristers[b]) ? 1 : 0
            case .eqri:
                regristers[c] = (regristers[a] == b) ? 1 : 0
            case .eqrr:
                regristers[c] = (regristers[a] == regristers[b]) ? 1 : 0
            }
        }
    }
}
