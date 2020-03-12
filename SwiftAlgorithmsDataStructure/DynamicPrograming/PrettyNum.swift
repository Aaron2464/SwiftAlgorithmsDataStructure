//
//  PrettyNum.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-12.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

//public class PrettyNumber {
//    public static void main(String args[]) {
//        Scanner sc = new Scanner(System.in);
//        int n = sc.nextInt();
//        long[][] d = new long[n+1][10];
//        for (int i=1; i<=9; i++) {
//            d[1][i] = 1;
//        }
//        // O(n)
//        for (int i=2; i<=n; i++) {
//            for (int j=0; j<=9; j++) {
//                d[i][j] = 0;
//                if (j-1 >= 0) {
//                    d[i][j] += d[i-1][j-1];
//                }
//                if (j+1 <= 9) {
//                    d[i][j] += d[i-1][j+1];
//                }
//            }
//        }
//        long ans = 0;
//        for (int i=0; i<=9; i++) {
//            ans += d[n][i];
//        }
//        // Time complexity: O(n)
//        System.out.println(ans);
//    }
//}
