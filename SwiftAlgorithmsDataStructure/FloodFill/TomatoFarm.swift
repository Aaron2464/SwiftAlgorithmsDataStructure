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
       
    func bfs(boxWidth: Int, boxLength: Int, tomatoBox: inout [[Int]]) {
        let q = Queue<Square>()
        for x in 0..<boxLength{
            for y in 0..<boxWidth {
                if tomatoBox[x][y] == 1{
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
                if nx >= 0 && nx < boxLength && ny >= 0 && ny < boxWidth {
                    if tomatoBox[nx][ny] == 0{
                        //if tomato unripe than add one day
                        if tomatoBox[x][y] > days-1{
                            days += 1
                        }
                        tomatoBox[nx][ny] = days
                        //enqueue to next day
                        q.enqueue(item: Square(x: nx, y: ny))
                    }
                }
            }
        }
    }
    
    // process the input
    for _ in 0..<boxLength {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        tomatoBox.append(row)
    }
    
    bfs(boxWidth: boxWidth, boxLength: boxLength, tomatoBox: &tomatoBox)
    
    if(tomatoBox.flatMap{$0}.filter{$0==0}.count>0) {
        print(-1)
    }else{
        print(days)
    }
}
