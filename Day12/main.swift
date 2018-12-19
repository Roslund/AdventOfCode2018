func step(state: String, offset: Int) -> (state: String, offset: Int) {

    //First padd the state so we can apply corner rules
    var padded = state
    var offset = offset
    if padded[padded.index(padded.startIndex, offsetBy: 0)] == "#" {
        padded = "...." + padded
        offset += 4
    } else if padded[padded.index(padded.startIndex, offsetBy: 1)] == "#" {
        padded = "..." + padded
        offset += 3
    } else if padded[padded.index(padded.startIndex, offsetBy: 2)] == "#" {
        padded = ".." + padded
        offset += 2
    } else if padded[padded.index(padded.startIndex, offsetBy: 3)] == "#" {
        padded = "." + padded
        offset += 1
    }
    if padded[padded.index(padded.endIndex, offsetBy: -1)] == "#" {
        padded = padded + "...."
    } else if padded[padded.index(padded.endIndex, offsetBy: -2)] == "#" {
        padded = padded + "..."
    } else if padded[padded.index(padded.endIndex, offsetBy: -3)] == "#" {
        padded = padded + ".."
    } else if padded[padded.index(padded.endIndex, offsetBy: -4)] == "#" {
        padded = padded + "."
    }

    var out = ".."
    for i in 2 ..< padded.count-2 {
        let l  = padded[padded.index(padded.startIndex, offsetBy: i-2)]
        let lc = padded[padded.index(padded.startIndex, offsetBy: i-1)]
        let c  = padded[padded.index(padded.startIndex, offsetBy: i)]
        let rc = padded[padded.index(padded.startIndex, offsetBy: i+1)]
        let r  = padded[padded.index(padded.startIndex, offsetBy: i+2)]

        switch "\(l)\(lc)\(c)\(rc)\(r)" {
        case "#####": out.append("#")
        case "#.##.": out.append("#")
        case "##.#.": out.append("#")
        case "#..#.": out.append("#")
        case "##...": out.append("#")
        case "#...#": out.append("#")
        case ".#..#": out.append("#")
        case ".#...": out.append("#")
        case "##.##": out.append("#")
        case "...##": out.append("#")
        case "..###": out.append("#")
        case ".##.#": out.append("#")
        case "##..#": out.append("#")
        default: out.append(".")
        }
    }

    return (out + "..", offset)
}

var initialState = "##.......#.######.##..#...#.#.#..#...#..####..#.##...#....#...##..#..#.##.##.###.##.#.......###....#"

//Mark: - Puzzle 1
var state = (initialState, 0)

for _ in 1 ... 20 {
    state = step(state: state.0, offset: state.1)
}

var sum = 0
for (i, character) in state.0.enumerated() {
    if character == "#" {
        sum += i - (state.1)
    }
}

print("Puzzle 1:",sum)


// why 98 you may ask? I checked at what point the state did'nt
// change and only "moved". This was done by not appending
// or prepeinding any additional dots (..)
state = (initialState, 0)
for _ in 1 ... 98 {
    state = step(state: state.0, offset: state.1)
}

sum = 0
for (i, character) in state.0.enumerated() {
    if character == "#" {
        sum += (i - state.1) + 50000000000 - 98
    }
}

print("Puzzle 2:", sum)
