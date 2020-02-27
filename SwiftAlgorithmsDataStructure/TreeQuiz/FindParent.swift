//
//  FindParent.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-21.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation
var a = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 27)

func postParent(_ parent: Int) {
    if parent == -1{ return }
    postOrder(a[parent][0])
    postOrder(a[parent][1])
    print(parent)
}

func findParent(){

    let n = Int(readLine()!)!
    for i in 0...n{
        let nodeInfo = readLine()!.split(separator: " ").map{String($0)}
        let edge = nodeInfo[0]
        let node = nodeInfo[1]
        a[i][0] = Int(edge)!
        a[i][1] = Int(node)!
        
        print(a)
    }
    postParent(0)
}

/*
 [[1,6],[6,3],[3,5],[4,1],[2,4],[4,7]]
 */


/*
 7
 1 6
 6 3
 3 5
 4 1
 2 4
 4 7
 */


/// Question: Who's my parent?
func WhosMyParent() {
    let n = Int(readLine()!)! // num of vertices
    var adjList = [[Int]](repeating: [], count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    var parent = [Int](repeating: 0, count: n + 1)
    
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v) // undirected u -> v, v -> u
        adjList[v].append(u)
    }
    
    check[1] = true
    let q = Queue<Int>()
    q.enqueue(item: 1)
    parent[1] = 0
    while !q.isEmpty() {
        let x = q.dequeue()!
        for v in adjList[x] {
            if (!check[v]) {
                check[v] = true
                parent[v] = x
                q.enqueue(item: v)
            }
        }
    }
    
    for i in 2...n {
        print(parent[i])
    }
}

/// Question: Diameter

struct Edge {
    let to: Int
    let cost: Int
}


/// Helper function for breadth first (level order) traversal
/// - Parameters:
///   - start: start Vertex (Node)
///   - check: check if the vertex (node) is visited
///   - dist: distance from start node to every vertex (node)
///   - adjList: adjacency list to store a tree
func bfsDiameter(start: Int, check: inout [Bool], dist: inout [Int], adjList: inout [[Edge]]) {
    let q = Queue<Int>()
    check[start] = true
    q.enqueue(item: start)
    while !q.isEmpty() {
        let x = q.dequeue()!
        for i in 0..<adjList[x].count {
            let edge = adjList[x][i]
            if check[edge.to] == false { // if not visited
                dist[edge.to] = dist[x] + edge.cost // update the distance
                q.enqueue(item: edge.to)
                check[edge.to] = true // mark visited
            }
        }
    }
}

func Diameter() {
    /// Pre-processing input from stdin
    /// Store in adjList
    let n = Int(readLine()!)!
    var adjList = [[Edge]](repeating: [], count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    var distance = [Int](repeating: 0, count: n + 1)
    
    for _ in 1...n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let node = line[0]
        var j = 1
        while j < line.count-2 {
            let next = line[j]
            let dist = line[j+1]
            adjList[node].append(Edge(to: next, cost: dist))
            if line[j + 2] == -1 {
                break
            }
            j += 2
        }
    }
    
    /// Find the furthest node from starting node 1
    bfsDiameter(start: 1, check: &check, dist: &distance, adjList: &adjList)
    var start = 1
    /// Check the furthest node
    for i in 2...n {
        if distance[i] > distance[start] {
            start = i
        }
    }
    
    /// Find the furthest node from the node we got from the previous step
    var check2 = [Bool](repeating: false, count: n + 1)
    var distance2 = [Int](repeating: 0, count: n + 1)
    bfsDiameter(start: start, check: &check2, dist: &distance2, adjList: &adjList)
    print(distance2.max()!) // linear time for getting the max value from the array distance2
}
