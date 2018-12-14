//
//  main.swift
//  AdventOfCode
//
//  Created by Anton Roslund on 2018-12-10.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

// Bara leta efter när skillnaden i y-led är minst
var state = particles
var min = (0, Int.max)

for _ in 0 ..< 10415 {
    state = state.step()
}

for i in 10415 ... 10513 {
    let bounds = state.positions().bounds()
    let yDiff = bounds.y.max - bounds.y.min

    print(i, ":", yDiff, ":", state.positions().bounds())

    if yDiff <= min.1 {
        min = (i, yDiff)
    }
    state = state.step()
}

// This is the state we should draw...
print(min)

//create a `CGContext`, draw into it and then call `makeImage` on the context to get a `CGImage`
