//
//  DateExtensionTests.swift
//  JamboTests
//
//  Created by 송형욱 on 1/25/25.
//

import Testing
import Foundation
@testable import Jambo

struct DateExtensionTests {

    @Test
    func date를_String으로_변환() async throws {
        let date = Date(timeIntervalSince1970: 1706153656)
        let ymd = "2024-01-25" // 년월일
        let ymdhms = "2024-01-25 12:34:16" // 년월일 시분초
        let formattedYMD = date.toString(format: "yyyy-MM-dd")
        let formattedYMDHMS = date.toString(format: "yyyy-MM-dd HH:mm:ss")
        #expect(ymd == formattedYMD)
        #expect(ymdhms == formattedYMDHMS)
    }

    @Test
    func unixTimestamp를_텍스트로_변환() async throws {
        /*
         모든 시간 관련 필드는 밀리초(ms) 단위의 Unix Timestamp 형식입니다.
             •    1년 이상 → yyyy.MM.dd
             •    1달 미만 & 1일 이상 → MM.dd
             •    1시간 이상 → {hours}h ago
             •    1분 이상 → {minutes}min ago
             •    1분 미만 → "Now"
         */
        let sec = Date(timeIntervalSince1970: 1706153656) // 24.01.25 12:34:16
        let min = Date(timeIntervalSince1970: 1706153716) // 24.01.25 12:35:16
        let hr = Date(timeIntervalSince1970: 1706157256) // 24.01.25 13:34:16
        let mon = Date(timeIntervalSince1970: 1708832116) // 24.01.25 12:34:16
        let year = Date(timeIntervalSince1970: 1740454516) // 25.01.25 12:34:16
        
        let datetime = Date(timeIntervalSince1970: 1706153656) // 24.01.25 12:34:16
        let secText = datetime.compare(from: sec)
        let minText = datetime.compare(from: min)
        let hrText = datetime.compare(from: hr)
        let monText = datetime.compare(from: mon)
        let yearText = datetime.compare(from: year)
        
        let exNow = "Now"
        let exMin = "1min ago"
        let exh = "1h ago"
        let exMon = "01.25"
        let exYear = "2024.01.25"
        
        #expect(secText == exNow)
        #expect(minText == exMin)
        #expect(hrText == exh)
        #expect(monText == exMon)
        #expect(yearText == exYear)
    }
}
