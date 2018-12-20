struct Program {
    var registers: [Int]
    let pcRegister: Int
    let instructions: [Instruction]

    init(_ instructions: [Instruction], registers: [Int] = [0,0,0,0,0,0], pcRegister: Int) {
        self.instructions = instructions
        self.registers = registers
        self.pcRegister = pcRegister
    }

}

extension Program {
    mutating func execute() {
        while true {
            // Check if pc is within program, else quit program
            if !instructions.indices.contains(registers[pcRegister]) { return }
            
            let instruction = instructions[registers[pcRegister]]
            let a = instruction.a
            let b = instruction.b
            let c = instruction.c

            switch instruction.op {
            case .addr:
                registers[c] = registers[a] + registers[b]
            case .addi:
                registers[c] = registers[a] + b
            case .mulr:
                registers[c] = registers[a] * registers[b]
            case .muli:
                registers[c] = registers[a] * b
            case .banr:
                registers[c] = registers[a] & registers[b]
            case .bani:
                registers[c] = registers[a] & b
            case .borr:
                registers[c] = registers[a] | registers[b]
            case .bori:
                registers[c] = registers[a] | b
            case .setr:
                registers[c] = registers[a]
            case .seti:
                registers[c] = a
            case .gtir:
                registers[c] = (a > registers[b]) ? 1 : 0
            case .gtri:
                registers[c] = (registers[a] > b) ? 1 : 0
            case .gtrr:
                registers[c] = (registers[a] > registers[b]) ? 1 : 0
            case .eqir:
                registers[c] = (a == registers[b]) ? 1 : 0
            case .eqri:
                registers[c] = (registers[a] == b) ? 1 : 0
            case .eqrr:
                registers[c] = (registers[a] == registers[b]) ? 1 : 0
            }

            // Increment PC
            registers[pcRegister] += 1
        }
    }
}
