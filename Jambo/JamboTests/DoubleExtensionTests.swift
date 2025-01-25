//
//  DoubleExtensionTests.swift
//  JamboTests
//
//  Created by 송형욱 on 1/25/25.
//

import Testing
import Foundation
@testable import Jambo

struct DoubleExtensionTests {

    @Test
    func km인지_m인지_구분해서_text로() async throws {
        /*
         📍 위치 표기
             •    현재 위치에서 1km 미만이면 미터(m) 단위로 표시합니다.
             •    1km 이상이면 정수(km) 단위로 표시합니다.
             •    예: 999m, 1km
         */
        let distance1km: Double = 1000
        let distance999m: Double = 999
        let km = "1km" + " · "
        let m = "999m" + " · "
        
        #expect(distance1km.toDistanceText == km)
        #expect(distance999m.toDistanceText == m)
    }
}
