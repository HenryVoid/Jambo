//
//  CardModel+Body.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

extension CardModel {
    struct BodyModel: Sendable, Hashable {
        var category: CategoryModel
        var contents: String
        var images: [ImageModel]
        
        init(category: CategoryModel, contents: String, images: [ImageModel]) {
            self.category = category
            self.contents = contents
            self.images = images
        }
        
        init?(dto response: CardListDTO.Card?) {
            guard let response,
                  let category = CategoryModel(dto: response.category),
                  let contents = response.body,
                  let images = response.cardImage?.compactMap({ ImageModel(dto: $0) }) else {
                      return nil
                  }
            self.category = category
            self.contents = contents
            self.images = images
        }
    }
}

extension CardModel.BodyModel {
    static let mock: Self = .init(
        category: .mock,
        contents: "Jill said Tony informed his children they were being disinherited, but in a separate interview, his daughter Allegra Curtis told Inside Edition she and her siblings were “blindsided” by the move and claimed her father washis children they were being disinherited, but in a separate interview, his daughter Allegra Curtis told Inside Edition she and her siblings were “blindsided” by the move and claimed her father was",
        images: .mock
    )
}
