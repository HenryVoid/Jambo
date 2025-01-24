//
//  Date+.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension Date {
    
    func toString(format: String = "yyyy.MM.dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /*
     모든 시간 관련 필드는 밀리초(ms) 단위의 Unix Timestamp 형식입니다.
         •    1년 이상 → yyyy.MM.dd
         •    1달 미만 & 1일 이상 → MM.dd
         •    1시간 이상 → {hours}h ago
         •    1분 이상 → {minutes}min ago
         •    1분 미만 → "Now"
     */
    func compareFromNow() -> String {
        let now = Date()
        let compare = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: now, to: self)
        if let year = compare.year,
           year > 0 {
            return self.toString(format: "yyyy.MM.dd")
        }
        if let month = compare.month,
           month > 0 {
            return self.toString(format: "MM.dd")
        }
        if let hour = compare.hour,
           hour > 0 {
            return "\(hour)h ago"
        }
        if let minute = compare.minute,
           minute > 0 {
            return "\(minute)min ago"
        }
        return "Now"
    }
}
