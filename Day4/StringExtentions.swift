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
