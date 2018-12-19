func higscore(players: Int, lastMarble: Int) -> Int {
    var players = Array(repeating: 0, count: players)

    var current: DoubbleLinkedList<Int>? = DoubbleLinkedList<Int>(0)
    current?.left = current; current?.right = current

    for i in 1 ... lastMarble {
        if i % 23 == 0 {
            // Gå vänster 6 steg, tar vi bort den 7'de hamnar vi på 7.
            current = current?.left(by: 6)
            players[i % players.count] += i + current!.removeLeft()!
        } else {
            current = current!.right!.addRight(i)
        }
    }

    return players.max()!
}

print(higscore(players: 465, lastMarble: 7194000))

