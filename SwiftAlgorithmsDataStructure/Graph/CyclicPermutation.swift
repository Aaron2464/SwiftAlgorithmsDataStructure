//
//  CyclicPermutation.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-02.
//  Copyright © 2020 AaronH. All rights reserved.
//
//2
//8
//3 2 7 8 1 4 5 6
//10
//2 1 3 4 5 6 7 9 10 8

import Foundation

var num = 0
func CyclicPermutation() {
    let testCases = Int(readLine()!)!
    
    for _ in 0..<testCases{
        num = 0
        let _ = Int(readLine()!)!
        let permutation = readLine()!.split(separator: " ").map{Int($0)!}
        var visited = [Bool](repeating: false, count: permutation.count)
        for i in 0..<permutation.count {
            if !visited[i]{
                num += 1
                dfsforCycle(start: i, visited: &visited, adjList: permutation)
            }
        }
        print(num)
    }
}

func dfsforCycle(start: Int, visited: inout [Bool], adjList: [Int]) {
    if visited[start] {
        return
    }
    visited[start] = true
    dfsforCycle(start: adjList[start] - 1, visited: &visited, adjList: adjList)
}

