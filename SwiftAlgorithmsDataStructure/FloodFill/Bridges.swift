//
//  Bridges.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-04.
//  Copyright © 2020 AaronH. All rights reserved.
//

//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 1 1 0 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0


import Foundation

func bridges(){
    struct Square {
        let x: Int
        let y: Int
    }
    let n = Int(readLine()!)!
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var bridgeLength = 1
    
    // country (input)
    var country = [[Int]]()
    
    func bfs(n: Int, country: inout [[Int]]) {
        let q = Queue<Square>()
        for x in 0..<n{
            for y in 0..<n {
                if country[x][y] == 1{
                    q.enqueue(item: Square(x: x, y: y))
                }
            }
        }
        
        while !q.isEmpty() {
            let square = q.dequeue()!
            let x = square.x
            let y = square.y
            // check 4 directions
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx >= 0 && nx < n && ny >= 0 && ny < n {
                    if country[nx][ny] == 0{
                        if country[x][y] > bridgeLength - 1{
                            bridgeLength += 1
                        }
                        country[nx][ny] = bridgeLength
                        //enqueue to next day
                        q.enqueue(item: Square(x: nx, y: ny))
                    }
                }
            }
        }
        print(country)
    }
    
    // process the input
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        country.append(row)
    }
    
    bfs(n: n, country: &country)
    
    var bridge = [Int](repeating: 0, count: n)
    var temp = 0
    for i in 0..<n{
        for j in 0..<n{
            if temp<country[i][j] {
                temp = country[i][j]
            }
        }
        bridge[i] = temp
    }
    bridge.sort()
    print(bridge)
    print(bridge[0])
}
