//
//  RepeatintSequence.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-06.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func next(A: Int, p: Int) -> Int {
  return String(A).compactMap{ power(base: Int(String($0))!, exponent: p) }.reduce(0, +)
}

func length(A: Int, p: Int, count: Int, check: inout [Int]) -> Int {
  if check[A] != 0 {
    return check[A] - 1
  }
  check[A] = count
  let nx = next(A: A, p: p)
  return length(A: nx, p: p, count: count + 1, check: &check)
}

func RepeatingSequence() {
  var check = Array<Int>(repeating: 0, count: 1000000)
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let A = input[0]
  let p = input[1]
  print(length(A: A, p: p, count: 1, check: &check))
}
