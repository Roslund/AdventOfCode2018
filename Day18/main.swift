import Foundation

func step(input: [[Character]]) -> [[Character]] {
    var out: [[Character]] = []

    for (y, line) in input.enumerated() {
        var outline: [Character] = []

        for (x, char) in line.enumerated() {
            if char == "." {
                if input.neigbours(x, y).count(of: "|") >= 3 {
                    outline.append("|")
                } else {
                    outline.append(char)
                }
            } else if char == "|" {
                if input.neigbours(x, y).count(of: "#") >= 3 {
                    outline.append("#")
                } else {
                    outline.append(char)
                }
            } else if char == "#" {
                if (input.neigbours(x, y).count(of: "|") >= 1) &&
                    (input.neigbours(x, y).count(of: "#") >= 1) {
                    outline.append("#")
                } else {
                    outline.append(".")
                }
            }

        }

        out.append(outline)
    }

    return out
}

var field = input
    .components(separatedBy: .newlines)
    .map { line in
        line.map { char in
            char
        }
}

var current = field
for _ in 1 ... 10 {
    current = step(input: current)
}

var resourseValue = current.count(of: "#") * current.count(of: "|")
print("Puzzle 1:", resourseValue)

// After a while the pattern repeats itself each 28 iteration
// 1000000000 % 28 = 20
// Therefore, we need to step untill the pattern repeats and offset by 20
// 28 * 14 = 420, by then the pattern should be repeating, add the offset
// and we get 440. therfore we run for 440 iiterations and print the value
current = field
for _ in 1 ... 440 {
    current = step(input: current)
}
resourseValue = current.count(of: "#") * current.count(of: "|")
print("Puzzle 2:", resourseValue)
