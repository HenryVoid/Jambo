//
//  CardModel+ConnectModel.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension CardModel {
    struct ConnectModel: Sendable, Hashable {
        var status: String
        var userCount: Int
        var messageList: [MessageModel]
    }
}

extension CardModel.ConnectModel {
    static let mock: Self = .init(
        status: "Connecting",
        userCount: 2,
        messageList: .mock
    )
}
