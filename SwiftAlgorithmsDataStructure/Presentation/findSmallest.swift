
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
            
        }
    }
    print(m)
}


