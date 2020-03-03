//
//  TomatoFarm.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-01.
//  Copyright © 2020 AaronH. All rights reserved.
//6 4
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1

import Foundation

func TomatoFarm(){
    struct Square {
        let x: Int
        let y: Int
    }
    let n = readLine()!.split(separator: " ").map { Int($0)! }

    //box size
    let boxWidth = n[0]
    let boxLength = n[1]
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var days = 0
    
    // tomatoBox (input)
    var tomatoBox = [[Int]]()
    // group (colored)
    // (In Java, int[][] group = new int[25][25]; )
    var group = [[Int]](repeating: [Int](repeating: 0, count: boxWidth), count: boxLength)
    
    func bfs(x: Int, y: Int, boxWidth: Int, boxLength: Int) {
        let q = Queue<Square>()
        q.enqueue(item: Square(x: x, y: y))
        days += 1

        while !q.isEmpty() {
            let square = q.dequeue()!
            let x = square.x
            let y = square.y
            // check 4 directions
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                // check the bounds
                if nx >= 0 && nx < boxLength && ny >= 0 && ny < boxWidth {
                    // check if there's a house and not yet marked in group
                    if tomatoBox[nx][ny] == 0{
                        tomatoBox[nx][ny] = 1
                    }else if tomatoBox[nx][ny] == 1{
                        days -= 1
                        bfs(x: nx, y: ny, boxWidth: boxWidth, boxLength: boxLength)
                    }else {
                        continue
                    }
                }
                print(tomatoBox)
            }
        }
    }
    
    // process the input
    for _ in 0..<boxLength {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        tomatoBox.append(row)
    }
    
    for x in 0..<boxLength{
        for y in 0..<boxWidth {
            if tomatoBox[x][y] == 1{
                bfs(x: x, y: y, boxWidth: boxWidth, boxLength: boxLength)
            }
        }
    }

//    print(id) // how many groups? (how many ids)
//    var answer = [Int](repeating: 0, count: boxWidth * boxLength)
//    for i in 0..<boxLength {
//        for j in 0..<boxWidth {
//            answer[group[i][j]] += 1
//        }
//    }
//    answer = Array(answer[1...id])
//    answer.sort()
//    for i in 0..<id {
//        print(answer[i])
//    }
    
    print(days)
}
