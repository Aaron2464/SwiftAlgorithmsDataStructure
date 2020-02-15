//
//  rollDiceSum.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-14.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation


func rollDiceSum(dice:Int, sum:Int,soFar:Int, _ chosen: inout [Int]){
    if soFar == sum{
        print(chosen)
    }else{
        for i in 1...6{
            if soFar + i + 1*(dice-1) <= sum
                && soFar + i + 6*(dice-1) >= sum{
                chosen.append(i)
                rollDiceSum(dice: dice-1, sum: sum, soFar: soFar + i, &chosen)
                chosen.removeLast()

            }
        }
    }
}

func runRollDiceSum() {
    var chosen = [Int]()
//    var chosen = [Int](repeating: 0, count: 10000)
    rollDiceSum(dice: 3, sum: 5,soFar: 6, &chosen)
}



