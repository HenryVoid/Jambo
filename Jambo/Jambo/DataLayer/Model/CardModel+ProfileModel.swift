//
//  CardModel+ProfileModel.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension CardModel {
    struct ProfileModel: Sendable, Hashable {
        var nickname: String
        var contents: String
        var image: ImageModel
    }
}

extension CardModel.ProfileModel {
    static let mock: Self = .init(
        nickname: "Tiffany",
        contents: "1km 1m ago",
        image: .init(
            width: 40,
            height: 40,
            url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_8.png"
        )
    )
}
