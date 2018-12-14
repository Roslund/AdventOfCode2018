// Mark: - Puzzle 1
var track = Track(from: input)
while true {
    if let location = track.step() {
        print(location)
        break
    }
}

// Mark: - Puzzle 2
track = Track(from: input)
while true {
    if let _ = track.step() {
        if track.carts.count == 1 {
            print(track.carts.first!.position)
            break
        }
    }
}
