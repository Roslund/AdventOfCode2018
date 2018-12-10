//
//  main.swift
//  AdventOfCode
//
//  Created by Anton Roslund on 2018-12-10.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

var state = particles
var min = Int.max

for _ in 0 ..< 10415 {
    state = state.step()
}

for i in 10415 ... 10513 {
    state = state.step()
    let area = state.area()
    print(i, ":", area, ":", state.positions().bounds())

    if area < min {
        min = area
    }
}
print(min)

