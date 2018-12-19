extension StringProtocol {
    /// Returns the string index by offset from start.
    func index(_ offsetFromStart: Int) -> Self.Index {
        return index(self.startIndex, offsetBy: offsetFromStart)
    }
}

extension String {
    func char(at i: Int) -> String {
        return String(self[index(i) ... index(i)])
    }

    func ToggledCase() -> String {
        var out = ""
        for i in 0 ..< count {
            if char(at: i) == char(at: i).lowercased() {
                out.append(char(at: i).uppercased())
            } else {
                out.append(char(at: i).lowercased())
            }
        }
        return out
    }
}
