//
//  CardModel+MessageModel.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension CardModel {
    struct MessageModel: Sendable, Hashable, Identifiable {
        enum TYPE: Hashable {
            case text(String)
            case image
        }
        let id = UUID()
        var type: TYPE
        var nickName: String
        var profileImage: ImageModel
        var dateTime: String
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
