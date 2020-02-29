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
    
    var adjList = [[Int]](repeating: [], count: n)

    let path = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u) // undirected graph
    }
    
    var visited = [Bool](repeating: false, count: n + 1)
    for v in 1..<adjList.count{
        if !visited[v]{
            sushiDFS(start: 1, visited: &visited, adjList: &adjList)
        }
    }
}

func sushiDFS(start: Int, visited: inout [Bool], adjList: inout [[Int]]) {
    visited[start] = true
    for v in adjList[start] {
        if !visited[v] {
            sushiDFS(start: v, visited: &visited, adjList: &adjList)
        }
    }
}
