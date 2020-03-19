//
//  SumOfSquare.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-13.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func sumOfSquare(_ n:Int) -> Int{
    var dp = [Int](repeating: 0, count: n + 1)
    for i in 0...n{
        dp[i] = i
        var j = 1

        while j * j <= i {
            print("while \(i)")

            if dp[i] > dp[i-j*j] + 1{
                dp[i] = dp[i-j*j] + 1
            }
            j += 1
        }
    }
    print(dp)
    return dp[n]
}
