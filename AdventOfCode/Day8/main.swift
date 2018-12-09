
let numbers = input.split(separator: " ").map {
    Int($0)!
}

var cursor = 0

func genereateNode(parrent: Node<[Int]>?) -> Node<[Int]> {
    let numberOfChildren = numbers[cursor]; cursor += 1
    let numberofMetadata = numbers[cursor]; cursor += 1

    let node = Node<[Int]>(parrent: parrent, content: [])

    for _ in 0 ..< numberOfChildren {
        node.children.append(genereateNode(parrent: node))
    }

    for _ in 0 ..< numberofMetadata {
        node.content.append(numbers[cursor])
        cursor += 1
    }
    return node
}

let tree = genereateNode(parrent: nil)



// Mark: - Puzzle 1
func sumTree(node: Node<[Int]>) -> Int {
    var value = 0
    for child in node.children {
        value += sumTree(node: child)
    }
    return value + node.content.reduce(0, +)
}

print("Puzzle 1:", sumTree(node: tree))

// Mark: - Puzzle 2

func sumTree2(node: Node<[Int]>) -> Int {
    // if a node does have child nodes
    if node.children.isEmpty {
        return node.content.reduce(0, +)
    }

    var value = 0
    for metadataEntry in node.content {
        if metadataEntry <= node.children.count {
            value += sumTree2(node: node.children[metadataEntry-1])
        }
    }
    return value
}

print("Puzzle 2:", sumTree2(node: tree))
