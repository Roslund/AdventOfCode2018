extension String {
    func oneCharDifferent(to other: String) -> Bool {
        var foundOneDifferent = false
        for (c1, c2) in zip(self, other) {
            if c1 != c2 {
                if foundOneDifferent == true {
                    return false
                }
                foundOneDifferent = true
            }
        }
        return foundOneDifferent
    }
}
