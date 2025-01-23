//
//  BodySection.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct BodyModel: Sendable, Hashable {
    var category: CategoryModel
    var contents: String
    var images: [ImageModel]
}

struct BodySection: View {
    var model: BodyModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            CategoryRow(category: model.category)
            
            ExpandableText(text: model.contents, lineLimit: 5)
            
            BodyImagesRow(images: model.images)
        }
    }
}

struct BodyImagesRow: View {
    var images: [ImageModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(images) { model in
                    CacheAsyncImage(
                        url: URL(string: model.url),
                        content: { image in
                            image.resizable()
                                .frame(width: model.width, height: model.height)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        },
                        placeholder: {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.textLighter)
                        }
                    )
                }
            }
            .padding(.vertical, 12)
        }
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    BodySection(model: .init(
        category: .init(name: "Talk & Listen", imageURL: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/categroy/Talk%26Listen.png"),
        contents: "Jill said Tony informed his children they were being disinherited, but in a separate interview, his daughter Allegra Curtis told Inside Edition she and her siblings were “blindsided” by the move and claimed her father washis children they were being disinherited, but in a separate interview, his daughter Allegra Curtis told Inside Edition she and her siblings were “blindsided” by the move and claimed her father was",
        images: [
            .init(width: 334, height: 334, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_0.png"),
            .init(width: 334, height: 334, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_0.png"),
            .init(width: 334, height: 334, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_0.png"),
        ]
    ))
}
