//
//  API+Client+.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import Foundation
import NetworkKit

extension API.Client {
    static let shared = API.Client(session: URLSession(configuration: .default), logger: API.Logger.shared, interceptors: [])
}
