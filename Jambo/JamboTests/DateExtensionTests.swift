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
        let time = TimeInterval(1706153656)
        let datetime = Date(timeIntervalSince1970: time)
        let text = datetime.compareFromNow()
        
        let expected = "2024.01.25"
        #expect(expected == text)
    }
}
