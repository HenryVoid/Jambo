//
//  LogTests.swift
//  JamboTests
//
//  Created by 송형욱 on 1/23/25.
//

import Testing
@testable import Jambo

struct LogTests {

    @Test
    func debugLog() async throws {
        let message = "message"
        let arguments = "Debug"
        Log.debug(message, arguments)
    }
    
    @Test
    func infoLog() async throws {
        let message = "message"
        let arguments = "Debug"
        Log.info(message, arguments)
    }
    
    @Test
    func networkLog() async throws {
        let message = "message"
        let arguments = "Debug"
        Log.network(message, arguments)
    }
    
    @Test
    func errorLog() async throws {
        let message = "message"
        let arguments = "Debug"
        Log.error(message, arguments)
    }
    
    @Test
    func customLog() async throws {
        let category = "user"
        let message = "message"
        let arguments = "Debug"
        Log.custom(category: category, message, arguments)
    }
}
