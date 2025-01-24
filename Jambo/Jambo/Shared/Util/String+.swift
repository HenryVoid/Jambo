//
//  String+.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension String {
    var toDate: Date? {
        let dateFormatter = DateFormatter()
        return dateFormatter.date(from: self)
    }
}
