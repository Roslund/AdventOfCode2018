class Node<Element> {
    var parrent: Node<Element>?
    var children: [Node<Element>]
    var content: Element

    init(parrent: Node<Element>?, content: Element, children: [Node<Element>] = []) {
        self.parrent = parrent
        self.content = content
        self.children = children
    }
}
