//
//  DFS.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-25.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func storeInAdjacencyListAndDFS() {
    let firstLine = readLine()!.split(separator: " ")
    // # of vertices
    let n = Int(firstLine[0])!
    // # of edges
    let m = Int(firstLine[1])!
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u) // undirected graph
    }
    
    var visited = [Bool](repeating: false, count: n + 1)
    var count = 0 // for connected component
    for v in 1..<adjList.count{
        if !visited[v]{
            dfs(start: 1, visited: &visited, adjList: &adjList)
            count += 1
        }
    }
    print(count)
}

func dfs(start: Int, visited: inout [Bool], adjList: inout [[Int]]) {
    visited[start] = true
    print(start)
    for v in adjList[start] {
        if !visited[v] {
            dfs(start: v, visited: &visited, adjList: &adjList)
        }
    }
}
