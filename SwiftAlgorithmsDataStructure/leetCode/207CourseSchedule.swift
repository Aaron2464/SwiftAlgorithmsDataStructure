//
//  207. Course Schedule.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-05.
//  Copyright © 2020 AaronH. All rights reserved.
// https://leetcode.com/problems/course-schedule/
// Input: 2, [[1,0]]
// Output: true
// Input: 2, [[1,0],[0,1]]
// Output: false
// Input: 3, [[0,1],[0,2],[1,2]]
// Output: true
// Input: 2,[]
// Output: true
// Input: 3, [[1,0],[1,2],[0,1]]
// Output: false

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var adj = [[Int]](repeating: [Int](repeating: 0, count: numCourses), count: numCourses)
    var indegree = [Int](repeating: 0, count: numCourses)
    var count = 0
    
    for i in 0..<prerequisites.count{
        let v = prerequisites[i][0]
        let u = prerequisites[i][1]
        if adj[u][v] == 0{
            indegree[v] += 1
        }
        adj[u][v] = 1
    }
    
    // topological sort
    let q = Queue<Int>()
    // initial state
    for v in 0..<indegree.count {
        if indegree[v] == 0 {
            q.enqueue(item: v)
        }
    }
    
    // BFS
    while !q.isEmpty() {
        let x = q.dequeue()!
        count += 1
        for v in 0..<numCourses {
            if adj[x][v] != 0 {
                indegree[v] -= 1 // decrement indegree
                if indegree[v] == 0 {
                    q.enqueue(item: v)
                }
            }
        }
    }
        
    return count == numCourses
}
