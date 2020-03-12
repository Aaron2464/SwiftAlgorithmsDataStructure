//
//  743NetworkDelayTime.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-12.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    
    var graph: [Int: [Int: Int]] = [:]
    
    /* Build graph: [source: [destination: weight]] */
    for t in times {
        graph[t[0], default: [:]][t[1]] = t[2]
    }
    
    /* Distance map: [node: distance from K to here] */
    var distMap: [Int: Int] = [:]
    distMap[K] = 0
    var q: [(node: Int, dist: Int)] = []
    
    q.append((node: K, dist: 0))
    
    while !q.isEmpty {
        let curr = q.removeLast()
        
        /* Get all neighbors of current node from graph */
        guard let nexts = graph[curr.node] else { continue }
        
        for (dest, weight) in nexts {
            if let distToNext = distMap[dest], curr.dist + weight >= distToNext {
                /* If there already exists a shorter distance to this neighbor,
                 we do not update distance to this neighbor */
                continue
            }
            /* Update the distance to this neighbor
            / Add this neighbor in the queue */
            distMap[dest] = curr.dist + weight
            q.append((node: dest, dist: curr.dist + weight))
        }
    }
    return distMap.count == N ? distMap.values.max() ?? -1 : -1
}
