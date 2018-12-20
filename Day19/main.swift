import Foundation

//Mark: - Puzzle 1
var program = Program(instructions, registers: [0,0,0,0,0,0], pcRegister: pcRegister)
program.execute()
print("Puzzle 1:", program.registers[0])

// Mark: - Puzzle 2
let num = 10_551_298
var sum = 0
for i in 1 ... num {
    if num % i == 0 {
        sum += i
    }
}
print("Puzzle 2:", sum)
