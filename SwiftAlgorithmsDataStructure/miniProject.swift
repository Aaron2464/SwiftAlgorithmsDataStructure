//
//  miniProject.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-13.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func showDirectories(path: String) {
    var filesCount = 0
    var dirsCount = 0
    getAllFilesAndDirectories(url: path, targetName: "", sign: "", filesCount: &filesCount, dirsCount: &dirsCount)
    print("\(dirsCount) directories, \(filesCount) files")
}

func fileExists(atPath path: String) -> Bool{
    var isDir: ObjCBool = false
    FileManager.default.fileExists(atPath: path, isDirectory: &isDir)
    return isDir.boolValue
}

func getAllFilesAndDirectories(url: String, targetName: String, sign: String, filesCount: inout Int, dirsCount: inout Int) {
    let f = FileManager()
    guard let files = try? f.contentsOfDirectory(atPath: url) else {
        return
    }
    let lastIndex: Int = files.endIndex - 1
    for (idx, file) in files.enumerated() {
        let filePath = url + "/" + file
        var addSign: String = ""
        var passSign: String = ""
        
        if idx == lastIndex {
            addSign = "└─ "
            passSign = sign + " "
        } else {
            addSign = "├─ "
            passSign = sign + "│ "
        }

        if fileExists(atPath: filePath){
            print(sign + addSign + file)
            dirsCount += 1
            getAllFilesAndDirectories(url: filePath, targetName: file, sign: passSign, filesCount: &filesCount, dirsCount: &dirsCount)
        } else {
            filesCount += 1
            print(sign + addSign + file)
        }
    }
}
