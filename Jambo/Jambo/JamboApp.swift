//
//  JamboApp.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import SwiftUI

@main
struct JamboApp: App {
    var body: some Scene {
        WindowGroup {
            CardListView(store: .init(
                initialState: .init(),
                reducer: {
                    CardListReducer()
                }
            ))
        }
    }
}
