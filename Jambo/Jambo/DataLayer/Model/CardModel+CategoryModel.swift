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
        
        init(name: String, imageURL: String) {
            self.name = name
            self.imageURL = imageURL
        }
        
        init?(dto response: CardListDTO.Category?) {
            guard let response,
                  let name = response.name,
                  let imageURL = response.imageURL else {
                return nil
            }
            self.name = name
            self.imageURL = imageURL
        }
    }
}

extension CardModel.CategoryModel {
    static let mock: Self = .init(
        name: "Talk & Listen",
        imageURL: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/categroy/Talk%26Listen.png"
    )
}
