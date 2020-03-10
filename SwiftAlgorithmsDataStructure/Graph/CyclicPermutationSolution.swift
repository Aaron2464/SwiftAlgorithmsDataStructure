//
//  CyclicPermutationSolution.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-06.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func simpleDFS(s: Int, check: inout [Bool], nodes: inout [Int]) {
  if check[s] { return }
  check[s] = true
  simpleDFS(s: nodes[s], check: &check, nodes: &nodes)
}

func PermutationCyclesSolution() {
  var numTests = Int(readLine()!)!

  while numTests > 0 {
    let n = Int(readLine()!)!
    var nodes = readLine()!.split(separator: " ").map { Int($0)! }
    nodes.insert(0, at: 0)
    var check = Array<Bool>(repeating: false, count: n+1)
    
    var answer = 0
    for v in 1...n {
      if check[v] == false {
        simpleDFS(s: v, check: &check, nodes: &nodes)
        answer += 1
      }
    }
    print(answer)
    numTests -= 1
  }
}
