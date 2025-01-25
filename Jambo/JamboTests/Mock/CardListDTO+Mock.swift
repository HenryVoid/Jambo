//
//  CardListDTO+Mock.swift
//  JamboTests
//
//  Created by 송형욱 on 1/25/25.
//

import Foundation
@testable import Jambo

extension CardListDTO.Response {
    static let mock = Self(
        list: [
            .init(
                cardType: "POST",
                profile: .init(
                    nickName: "Jimmypage",
                    location: .init(
                        longitude: -73.707902000000004,
                        latitude: 40.743143000000003
                    ),
                    profileImage: .init(
                        width: 40,
                        height: 40,
                        imageURL: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_1.png"
                    )
                ),
                card: .init(
                    cardType: "POST",
                    cardID: "678c8ae03602eb023120cb29",
                    category: .init(
                        name: "Friendship & Love",
                        imageURL: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/categroy/Friendship%26Love.png"
                    ),
                    body: "Friendship isn’t about who you’ve known the longest—it’s about who makes your life better.",
                    cardImage: [
                        .init(width: 334, height: 334, imageURL: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_5.png")
                    ],
                    connect: .init(
                        status: "CONNECTING",
                        userCount: 2,
                        messageList: [
                            .init(
                                nickName: "WhatsUp",
                                body: .init(type: "text/plain", value: .string("What is the name")),
                                profileImage: .init(width: 30, height: 30, imageURL: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_0.png"),
                                sendAt: 1737354732282
                            )
                        ]
                    ),
                    createdAt: 1736640000000
                )
            )
        ],
        hasNext: true
    )
}
