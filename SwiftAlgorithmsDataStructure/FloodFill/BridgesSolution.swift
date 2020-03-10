//
//  BridgesSolution.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-06.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func BridgesSolution() {
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  let n = Int(readLine()!)!
  var group = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: n), count: n)
  var distance = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: n), count: n)
  var countryMap = [[Int]]()
  
  for _ in 0..<n {
    countryMap.append(readLine()!.split(separator: " ").map { Int($0)! })
  }
  
  // Labeling Groups
  var count = 0
  for i in 0..<n {
    for j in 0..<n {
      if countryMap[i][j] == 1 && group[i][j] == 0 {
        count += 1
        group[i][j] = count
        let q = Queue<(Int, Int)>()
        q.enqueue(item: (i, j))
        while !q.isEmpty() {
          let (x, y) = q.dequeue()!
          for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            if 0 <= nx && nx < n && 0 <= ny && ny < n {
              if countryMap[nx][ny] == 1 && group[nx][ny] == 0 {
                group[nx][ny] = count
                q.enqueue(item: (nx, ny))
              }
            }
          }
        }

      }
    }
  }
  // Marking distance
  let q = Queue<(Int, Int)>()
  for i in 0..<n {
    for j in 0..<n {
      distance[i][j] = -1
      if countryMap[i][j] == 1 {
        q.enqueue(item: (i, j))
        distance[i][j] = 0
      }
    }
  }
  // "Land expansion"
  // Priority: group 1, 2, 3, ...
  while !q.isEmpty() {
    let (x, y) = q.dequeue()!
    for k in 0..<4 {
      let nx = x + dx[k]
      let ny = y + dy[k]
      if 0 <= nx && nx < n && 0 <= ny && ny < n {
        if distance[nx][ny] == -1 {
          distance[nx][ny] = distance[x][y] + 1
          group[nx][ny] = group[x][y]
          q.enqueue(item: (nx, ny))
        }
      }
    }
  }
  
  // get the minimum
  var answer = -1
  for i in 0..<n {
    for j in 0..<n {
      for k in 0..<4 {
        let x = i + dx[k]
        let y = j + dy[k]
        if 0 <= x && x < n && 0 <= y && y < n {
          if group[i][j] != group[x][y] {
            if (answer == -1 || answer > distance[i][j] + distance[x][y]) {
              answer = distance[i][j] + distance[x][y]
            }
          }
        }
      }
    }
  }
  print(answer)
}
