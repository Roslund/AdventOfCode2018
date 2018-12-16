import Foundation

struct Sample {
    let before: [Int]
    let instruction: [Int]
    let after: [Int]
    var op: Int { return instruction[0] }
    var a: Int { return instruction[1] }
    var b: Int { return instruction[2] }
    var c: Int { return instruction[3] }

    init(_ before: [Int], _ instruction: [Int], _ after: [Int]) {
        self.before = before
        self.instruction = instruction
        self.after = after
    }
}

func parseInput(_ input: String) -> [Sample] {
    let rawSamples = input
        .components(separatedBy: .newlines)
        .split(separator: "")
        .map({ Array($0) })

    var samples: [Sample] = []
    for rawSample in rawSamples {
        let before = [Int(rawSample[0].char(at: 9))!,
                      Int(rawSample[0].char(at: 12))!,
                      Int(rawSample[0].char(at: 15))!,
                      Int(rawSample[0].char(at: 18))!]
        let after = [Int(rawSample[2].char(at: 9))!,
                     Int(rawSample[2].char(at: 12))!,
                     Int(rawSample[2].char(at: 15))!,
                     Int(rawSample[2].char(at: 18))!]
        let instruction = rawSample[1]
            .split(separator: " ")
            .map({ Int($0)! })

        samples.append(Sample(before, instruction, after))
    }
    
    return samples
}

extension Sample {
    func possibleOPs() -> [String] {
        var possible: [String] = []

        if after[c] == before[a] + before[b] {
            possible.append("addr")
        }
        if after[c] == before[a] + b {
            possible.append("addi")
        }
        if after[c] == before[a] * before[b] {
            possible.append("mulr")
        }
        if after[c] == before[a] * b {
            possible.append("muli")
        }
        if after[c] == before[a] & before[b] {
            possible.append("banr")
        }
        if after[c] == before[a] & b {
            possible.append("bani")
        }
        if after[c] == before[a] | before[b] {
            possible.append("borr")
        }
        if after[c] == before[a] | b {
            possible.append("bori")
        }
        if after[c] == before[a] {
            possible.append("setr")
        }
        if after[c] == a {
            possible.append("seti")
        }
        if after[c] == ((a > before[b]) ? 1 : 0) {
            possible.append("gtir")
        }
        if after[c] == ((before[a] > b) ? 1 : 0) {
            possible.append("gtri")
        }
        if after[c] == ((before[a] > before[b]) ? 1 : 0) {
            possible.append("gtrr")
        }
        if after[c] == ((a == before[b]) ? 1 : 0) {
            possible.append("eqir")
        }
        if after[c] == ((before[a] == b) ? 1 : 0) {
            possible.append("eqri")
        }
        if after[c] == ((before[a] == before[b]) ? 1 : 0) {
            possible.append("eqrr")
        }
        
        return possible
    }
}
