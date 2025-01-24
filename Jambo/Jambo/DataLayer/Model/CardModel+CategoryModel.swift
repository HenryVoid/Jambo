//
//  CardModel+CategoryModel.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension CardModel {
    struct CategoryModel: Sendable, Hashable {
        let name: String
        let imageURL: String
    }
}

extension CardModel.CategoryModel {
    static let mock: Self = .init(
        name: "Talk & Listen",
        imageURL: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/categroy/Talk%26Listen.png"
    )
}
