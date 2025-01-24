//
//  CardModel+ImageModel.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension CardModel {
    struct ImageModel: Sendable, Hashable, Identifiable {
        let id = UUID()
        var width: CGFloat
        var height: CGFloat
        var url: String
    }
}

extension CardModel.ImageModel {
    static let mock: Self = .init(width: 40, height: 40, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_8.png")
}

extension [CardModel.ImageModel] {
    static let mock: Self = [
        .init(width: 334, height: 334, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_0.png"),
        .init(width: 334, height: 334, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_0.png"),
        .init(width: 334, height: 334, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_0.png"),
    ]
}
