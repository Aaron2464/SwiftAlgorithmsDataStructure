//
//  210. CourseSchedule II.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-05.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var adj = [[Int]](repeating: [], count: numCourses)
    var indegree = [Int]()
    
    for i in 0..<prerequisites.count {
        let u = prerequisites[i][0]
        let v = prerequisites[i][1]
//        if 
        
    }
}
