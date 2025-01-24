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
        
        init(status: String, userCount: Int, messageList: [MessageModel]) {
            self.status = status
            self.userCount = userCount
            self.messageList = messageList
        }
        
        init?(dto response: CardListDTO.Connect?) {
            guard let response,
                  let status = response.status,
                  let userCount = response.userCount,
                  let messageList = response.messageList else {
                return nil
            }
            self.status = status
            self.userCount = userCount
            self.messageList = messageList.compactMap { MessageModel(dto: $0) }
        }
    }
}

extension CardModel.ConnectModel {
    static let mock: Self = .init(
        status: "Connecting",
        userCount: 2,
        messageList: .mock
    )
}
