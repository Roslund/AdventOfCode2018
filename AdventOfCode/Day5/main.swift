/*
 Swift has unicode strings and therfore does not allow accessing
 strings by subscript indexes. I have written a few helper extentions:
 String.index(atOffset:), String.string(range:) and String.toggleCase()
 */

func reactedCount(_ constInput: String) -> Int {
    var input = constInput
    var i = 0

    while true {
        // Exit condition (we can't have this in the while
        // loop because it changes when we remove stuff)
        if i == input.count-1 { break }

        if input.char(at: i) == input.char(at: i+1).ToggledCase() {
            input.removeSubrange(input.index(i) ... input.index(i+1))

            if i > 0 { i -= 1 } // Check for bounds
        }
        else { i += 1 }
    }

    return input.count
}

// Mark: Puzzle 1
print("Puzzle 1:", reactedCount(input))

// Mark: - Puzzle 2
let letters = "abcdefghijklmnopqrstuvwxyz"
var lowest = Int.max
var inputs: [String] = []

// Add all permuations of polymer when removing one kind
for char in letters {
    inputs.append(input.filter {
        $0 != char && "\($0)" != "\(char)".ToggledCase()
    })
}


for input in inputs {
    if reactedCount(input) < lowest {
        lowest = input.count
    }
}

print("Puzzle 2:", lowest)
