
//
//  algorithm.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-20.
//  Copyright © 2020 AaronH. All rights reserved.
//

//Find the smallest/largest M elements in a stream of N items.
//Your algorithm should not exceed the following complexity.
//Time: O(N lg M)
//Space: O(M)
//You can think of a stream of items as stdin.
//You are allowed to use any data structures / algorithms of your choice.

import Foundation
var m: [Int] = [Int]()

func findSmallest(n: [Int], count: Int) {
    for i in n {
        if m.count < count {
            m.append(i)
        } else {
            m = compare(inputM: m, append: i)
        }
    }
    print(m)
}


func compare(inputM: [Int], append: Int) -> [Int]{
    m = quickSort(inputM)
    // find smallest
    if m[m.endIndex-1] > append{
        m = [Int](m.dropLast())
        m.append(append)
    }
    
    // find largest
//        if m[m.startIndex] < append{
//            m = [Int](m.dropFirst())
//            m.append(append)
//        }
    return m
}


			
