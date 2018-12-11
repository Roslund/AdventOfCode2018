class DoubbleLinkedList<Element> {
    var left: DoubbleLinkedList<Element>?
    var right: DoubbleLinkedList<Element>?
    let element: Element

    init(_ element: Element) {
        self.element = element
    }
}

extension DoubbleLinkedList {
    func addRight(_ element: Element) -> DoubbleLinkedList<Element>? {
        let temp = right
        right = DoubbleLinkedList<Element>(element)
        right?.right = temp
        right?.right?.left = right
        right?.left = self
        return right
    }

    func removeRight() -> Element? {
        let temp = right
        right?.right?.left = self
        right = right?.right
        return temp?.element
    }

    func removeLeft() -> Element? {
        let temp = left
        left?.left?.right = self
        left = left?.left
        return temp?.element
    }

    func remove() -> Element? {
        left?.right = right
        right?.left = left
        return element
    }

    func left(by steps: Int) -> DoubbleLinkedList<Element>? {
        var current: DoubbleLinkedList<Element>? = self
        for _ in 1 ... steps {
            current = current?.left
        }
        return current
    }
}
