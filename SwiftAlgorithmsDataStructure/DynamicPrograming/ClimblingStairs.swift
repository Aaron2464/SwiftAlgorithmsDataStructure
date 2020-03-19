//
//  ClimblingStairs.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-17.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func ClimblingStairs(n: Int) -> Int{
    var dp = [Int](repeating: 0, count: n + 1)
    for i in 0...n{
        if i <= 2{
            dp[i] = i
        }else{
            dp[i] = dp [i-1] + dp[i-2]
        }
    }
    return dp[n]
}

//func ClimblingStairs(n: Int) -> Int{
//    return fib(n: n + 1)
//}
//
//func fib(n : Int) -> Int{
//    if n <= 1{return n}
//    return fib(n: n - 1) + fib(n: n - 2)
//}
