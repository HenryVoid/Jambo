//
//  Env.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import Foundation

public enum Env {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let BASE_URL = "BASE_URL"
        }
    }

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
}

extension Env {
    
    // MARK: - Plist values
    
    public static let BASE_URL: String = {
        guard let baseURL = Env.infoDictionary[Keys.Plist.BASE_URL] as? String else {
            fatalError("BASE URL not set in plist for this environment")
        }
        return baseURL
    }()
}
