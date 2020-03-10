//
//  1029TwoCityScheduling.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-06.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func twoCityScheduleCost(_ costs: [[Int]]) -> Int {
    let n = costs.count/2

    var total: Int = Int()
    var dist = [Int]()
    for cost in costs{
        dist.append(cost[0] - cost[1])
        total += cost[0]
    }

    dist.sort(by:>)
    for i in 0..<n{
        total -= dist[i]
    }
    return total
}
