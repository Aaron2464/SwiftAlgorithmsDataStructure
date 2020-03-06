//
//  TopologicaSort.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-03.
//  Copyright © 2020 AaronH. All rights reserved.
//
//9 10
//1 4
//1 9
//2 4
//3 5
//4 7
//5 7
//5 6
//7 6
//6 8
//7 8


import Foundation

func TopologicalSort() {
    let firstline = readLine()!
                        .split(separator: " ")
                        .map { Int($0)! }

    let N = firstline[0]
    let M = firstline[1]
    
    var adj = [[Int]](repeating: [Int](), count: N + 1)
    var indegree = [Int](repeating: 0, count: N + 1)
    
    for _ in 0..<M { // M edges
        let edge = readLine()!
                        .split(separator: " ")
                        .map { Int($0)! }
        let u = edge[0]
        let v = edge[1]
        adj[u].append(v)
        indegree[v] += 1
    }
    
    // topological sort
    let q = Queue<Int>()
    // initial state
    for v in 1...N { // N vertex
        if indegree[v] == 0 {
            q.enqueue(item: v)
        }
    }
    
    // BFS
    while !q.isEmpty() {
        let x = q.dequeue()!
        print(x) // process
        for v in adj[x] {
            indegree[v] -= 1 // decrement indegree
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
}

