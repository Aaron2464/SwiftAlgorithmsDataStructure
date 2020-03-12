//
//  NonDecreasingDigits.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-12.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func NonDecreasingDigit(howManyDigits:Int){
    var count = 0
    var DP = [[Int]](repeating: [Int](repeating: 0, count: 10), count: howManyDigits)
    for i in 0...9 {
        DP[0][i] = 1
    }
    
    for j in 1..<howManyDigits {
        for k in 0...9 {
            for s in 0...j{
                if (k-1 >= 0) {
                    DP[j][k] += DP[s][k-1]
                }
//                if (k+1 <= 9) {
//                    DP[j][k] += DP[s][k+1]
//                }
            }
        }
    }
    
    for x in 0...9{
        count += DP[howManyDigits - 1][x]
    }
    
    print(count)
}

