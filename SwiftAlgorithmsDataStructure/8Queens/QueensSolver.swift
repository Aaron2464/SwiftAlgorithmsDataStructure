//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.
var sum = 0
var count = 0
var col = 0
func solveQueens(board: inout Board, row: Int){
    if count == 0{
        sum += 1
    }
    
    if row > board.size{
        return
    }
    
    if row == board.size{
        count += 1
        print("\(board)\(count) possible ways, \(sum) calls")
        print()
        return
    }else{
        for col in 0..<board.size{
            if board.isSafe(row: row, col: col){
                board.place(row: row, col: col)
                solveQueens(board: &board, row: row + 1)
                board.remove(row: row, col: col)
            }
        }
    }
}

