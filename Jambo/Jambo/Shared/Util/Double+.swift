//
//  Double+.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension Double {
    var toDistanceText: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfEven
        formatter.maximumFractionDigits = 0
        
        if (self / 1000) >= 1 {
            // km
            let result = formatter.string(for: (self / 1000)) ?? "0"
            return result + "km · "
        } else {
            // m
            let result = formatter.string(for: self) ?? "0"
            return result + "m · "
        }
    }
}
