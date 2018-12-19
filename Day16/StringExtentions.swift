extension StringProtocol {
    /// Returns the string index by offset from start.
    func index(_ offsetFromStart: Int) -> Self.Index {
        return index(self.startIndex, offsetBy: offsetFromStart)
    }
}

extension StringProtocol {
    func char(at i: Int) -> String {
        return String(self[index(i) ... index(i)])
    }
}
