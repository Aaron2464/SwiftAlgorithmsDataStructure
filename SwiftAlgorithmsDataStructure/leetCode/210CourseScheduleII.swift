//
//  210. CourseSchedule II.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-05.
//  Copyright © 2020 AaronH. All rights reserved.
//
//Input: 2, [[1,0]]
//Output: [0,1]

//Input: 4, [[1,0],[2,0],[3,1],[3,2]]
//Output: [0,1,2,3] or [0,2,1,3]

//Input: 3, [[0,2],[1,2],[2,0]]
//Output: [1]

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var adj = [[Int]](repeating: [], count: numCourses)
    var indegree = [Int](repeating: 0, count: numCourses + 1)
    var course = [Int]()
    
    for i in 0..<prerequisites.count {
        let u = prerequisites[i][0]
        let v = prerequisites[i][1]
        adj[u].append(v)
        indegree[v] += 1
    }
    
    let q = Queue<Int>()
    
    for i in 0..<numCourses{
        if indegree[i] == 0 {
            q.enqueue(item: i)
            course.append(i)
        }
    }
    
    //    bfs
    while !q.isEmpty(){
        let n = q.dequeue()
        for v in adj[n!]{
            indegree[v] -= 1 // decrement indegree
            if indegree[v] == 0 {
                q.enqueue(item: v)
                course.append(v)
            }
        }
        
    }
    if course.count == numCourses{
        return course.reversed()
    }else{
        return []
    }
}
