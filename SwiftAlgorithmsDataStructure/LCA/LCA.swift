//
//  LCA.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-26.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func LCA(){
    let n = Int(readLine()!)!
    var adjList = [[Int]](repeating: [], count: n + 1)
    for _ in 0..<n {
        let nodeInfo = readLine()!.split(separator: " ").map{String($0)}
        let x = Int(nodeInfo[0])!
        let l = Int(nodeInfo[1])!
        adjList[x].append(l)
        adjList[l].append(x)
    }
    
}


//15
//1 2
//1 3
//2 4
//3 7
//6 2
//3 8
//4 9
//2 5
//5 11
//7 13
//10 4
//11 15
//12 5
//14 7
//6
//6 11
//10 9
//2 6
//7 6
//8 13
//8 15

//let firstLine = readLine()!.split(separator: " ")
//    let n = Int(firstLine[0])!
//    let m = Int(firstLine[1])!
//    var adjList = Array<Array<Int>>(repeating: [], count: n + 1)
//
//    for _ in 0..<m{
//        let edge = readLine()!.split(separator: " ")
//        let u = Int(edge[0])!
//        let v = Int(edge[1])!
//        adjList[u].append(v)
//        adjList[v].append(u)
//    }
//
//    //BFS
//    var visited: [Bool] = [Bool](repeating: false, count: n + 1)
////    var depth  = [Int](repeating: 0, count: n + 1)
////    var parent = [Int](repeating: 0, count: n + 1)
//    let quene = Queue<Int>()
//
//    quene.enqueue(item: 1) // start form vertex 1
//    visited[1] = true
//
//    while !quene.isEmpty() {
//        let first = quene.dequeue()!
//        for v in adjList[first]{
//            if !visited[v]{
////                parent[v] = first
//                quene.enqueue(item: v)
//                visited[v] = true
//            }
//        }
//    }
