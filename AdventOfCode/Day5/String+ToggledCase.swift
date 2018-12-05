extension String {
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
