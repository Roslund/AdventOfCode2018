struct Instruction {
    let op: Operation
    let a: Int
    let b: Int
    let c: Int

    init(_ op: Operation, _ a: Int, _ b: Int, _ c: Int) {
        self.op = op
        self.a = a
        self.b = b
        self.c = c
    }
}
