//
//  CardModel+MessageModel.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension CardModel {
    struct MessageModel: Sendable, Hashable {
        enum TYPE: Hashable {
            case text(String)
            case image
        }
        var type: TYPE
        var nickName: String
        var profileImage: ImageModel
        var dateTime: String
        
        init(type: TYPE, nickName: String, profileImage: ImageModel, dateTime: String) {
            self.type = type
            self.nickName = nickName
            self.profileImage = profileImage
            self.dateTime = dateTime
        }
        
        init?(dto response: CardListDTO.MessageList?) {
            guard let response,
                  let type = response.body?.value,
                  let nickName = response.nickName,
                  let profileImage = ImageModel(dto: response.profileImage),
                  let sendAt = response.sendAt else {
                return nil
            }
            switch type {
            case .profileImage:
                self.type = .image
            case .string(let string):
                self.type = .text(string)
            }
            self.nickName = nickName
            self.profileImage = profileImage
            let time = TimeInterval(sendAt) / 1000.0
            self.dateTime = Date(timeIntervalSince1970: time).compare(from: Date())
        }
    }
}

extension [CardModel.MessageModel] {
    static let mock: Self = [
        .init(
            type: .text("Come as you are as you me cause i know Blah Blah Blah Blah"),
            nickName: "Ethan",
            profileImage: .init(
                width: 30,
                height: 30,
                url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_7.png"
            ),
            dateTime: "3m ago"
        ),
        .init(
            type: .image,
            nickName: "Sophia",
            profileImage: .init(
                width: 30,
                height: 30,
                url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_6.png"
            ),
            dateTime: "2h ago"
        ),
        .init(
            type: .text("Good😄"),
            nickName: "AfrohairGirl",
            profileImage: .init(
                width: 30,
                height: 30,
                url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_3.png"
            ),
            dateTime: "5h ago"
        ),
    ]
}
