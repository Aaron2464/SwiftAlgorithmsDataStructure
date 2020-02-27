//
//  evaluate.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-12.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func evaluate(_ math:String) -> String{
    var result = math
    if let i = result.firstIndex(of: "(") {
        result.remove(at: i)
        return evaluate(result)
    }
    //    else {
    //        switch result.index(before: ) {
    //        case "+":
    //        default:
    //        }
    //    }
    return ""
}
