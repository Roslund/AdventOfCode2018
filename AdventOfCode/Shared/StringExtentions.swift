extension String {
    func string(in range: ClosedRange<Int> ) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start ... end])
    }

    func string(in range: Range<Int> ) -> String {
        return string(in: range.lowerBound ... (range.upperBound - 1))
    }

    func string(in range: PartialRangeFrom<Int> ) -> String {
        return string(in: range.lowerBound ... (endIndex.encodedOffset - 1))
    }
}

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
