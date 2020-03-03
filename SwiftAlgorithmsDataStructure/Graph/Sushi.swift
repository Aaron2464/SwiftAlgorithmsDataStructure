//
//  Sushi.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-27.
//  Copyright © 2020 AaronH. All rights reserved.
//
//Input Specification
//
//The first line of input contains 2 integers, 𝑁 and 𝑀.
//( 2 ≤ 𝑀 ≤ 𝑁 ≤ 100,000)
//The second line of input contains 𝑀 distinct integers indicating the Japanese restaurants which offer real sushi.
//The next 𝑁 - 1 lines contain 2 integers each. The ithline contains aiand bi (0 ≤ ai , bi ≤ N - 1) , representing a path between the two restaurants numbered ai and bi.
//
//Output Specification
//
//Your program should output one line, containing one integer - the minimum amount of time Mika needs to spend travelling on roads in order to visit all Japanese restaurants that offer real sushi, in minutes.
//8 2
//5 2
//0 1
//0 2
//2 3
//4 3
//6 1
//1 5
//7 3

import Foundation

func SushiAdjacencyList() {
    let firstLine = readLine()!.split(separator: " ")
    // # of vertices
    let n = Int(firstLine[0])!
    // # of edges
    let m = Int(firstLine[1])!
    
    var adjList = [Set<Int>]()

    let realSushi = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].insert(v)
        adjList[v].insert(u) // undirected graph
    }
    
    var visited = [Bool](repeating: false, count: n + 1)
    for v in 1..<adjList.count{
        if !visited[v]{
            sushiDFS(start: 1, visited: &visited, adjList: &adjList)
        }
    }
}

func removeLeaves(from adjList: [Set<Int>], v: Int, sushi:[Int], visited: inout [Bool]) {
    visited[v] = true
    for u in adjList[v] {
        if !visited[u] {
            removeLeaves(from: adjList, v: u, sushi: sushi, visited: &visited)
        }
    }
    if adjList[v].count == 1 && !sushi.contains(v) {
        for i in adjList[v]{
//            adjList[i].remove(v)
        }
//        adjList[v].removeAll()
    }
}

func sushiDFS(start: Int, visited: inout [Bool], adjList: inout [Set<Int>]) {
    visited[start] = true
    for v in adjList[start] {
        if !visited[v] {
            sushiDFS(start: v, visited: &visited, adjList: &adjList)
        }
    }
}


//public final class Graph {
//    let V: Int
//    private(set) var E: Int
//    private var adj: [Set<Int>]
//
//    public init(V: Int) {
//        self.V = V
//        self.E = 0
//        self.adj = [Set<Int>]()
//        self.adj.reserveCapacity(V)
//        for _ in 0..<V {
//            self.adj.append(Set<Int>())
//        }
//    }
//
//    public func addEdge(from u: Int, to v: Int) {
//        E += 1
//        adj[u].insert(v)
//        adj[v].insert(u)
//    }
//
//    public func degree(of v: Int) -> Int {
//        return adj[v].count
//    }
//
//    public func adj(to v: Int) -> Set<Int> {
//        return adj[v]
//    }
//
//    public func removeAllEdges(from v: Int) {
//        for u in adj[v] {
//            adj[u].remove(v)
//        }
//        adj[v].removeAll()
//    }
//}
//
//public struct DFS {
//    private(set) var marked: [Bool]
//    private(set) var depth: [Int]
//    private(set) var count: Int = 0
//    private let s: Int
//
//    public init(G: Graph, s: Int) {
//        self.s = s
//        marked = [Bool](repeating: false, count: G.V)
//        depth = [Int](repeating: -1, count: G.V)
//        dfs(G, v: s, d: 0)
//    }
//
//    private mutating func dfs(_ G: Graph, v: Int, d: Int) {
//        marked[v] = true
//        depth[v] = d
//        count += 1
//        for u in G.adj(to: v) {
//            if !marked[u] {
//                dfs(G, v: u, d: d + 1)
//            }
//        }
//    }
//
//    public func visited(v: Int) -> Bool {
//        return marked[v]
//    }
//
//    public func depth(of v: Int) -> Int {
//        return depth[v]
//    }
//}
//
//public func removeLeaves(from graph: Graph, v: Int, sushi: Set<Int>, visited: inout [Bool]) {
//    visited[v] = true
//    for u in graph.adj(to: v) {
//        if !visited[u] {
//            removeLeaves(from: graph, v: u, sushi: sushi, visited: &visited)
//        }
//    }
//    if graph.degree(of: v) == 1 && !sushi.contains(v) {
//        graph.removeAllEdges(from: v)
//    }
//}
//
//public func sushiSolve() {
//    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
//    let n = firstLine[0]
//
//    let nextLine = readLine()!.split(separator: " ").map { Int($0)! }
//    let realSushi = Set<Int>(nextLine)
//
//    let graph = SGraph(V: n)
//    for _ in 0..<n - 1 {
//        let edge = readLine()!.split(separator: " ").map { Int($0)! }
//        graph.addEdge(from: edge[0], to: edge[1])
//        graph.addEdge(from: edge[1], to: edge[0])
//    }
//
//    let start = realSushi.first!
//    var visited = [Bool](repeating: false, count: graph.V)
//    removeLeaves(from: graph, v: start, sushi: realSushi, visited: &visited)
//
//    let dfs = DFS(G: graph, s: start)
//    var maxVertex = start
//    for i in 0..<n {
//        if dfs.depth(of: i) > dfs.depth(of: maxVertex) {
//            maxVertex = i
//        }
//    }
//
//    let dfs2 = DFS(G: graph, s: maxVertex)
//    var diameter = maxVertex
//    for i in 0..<n {
//        if dfs2.depth(of: i) > dfs2.depth(of: diameter) {
//            diameter = i
//        }
//    }
//
//    print(2 * (dfs2.count - 1) - dfs2.depth(of: diameter))
//}
