//
//  BodySection.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct BodySection: View {
    var model: CardModel.BodyModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            CategoryRow(category: model.category)
            
            ExpandableText(text: model.contents, lineLimit: 5)
            if model.images.count > 0 {
                BodyImagesRow(images: model.images)
                    .padding(.top, 8)
            }
        }
        .padding(.top, 8)
    }
}

extension BodySection {
    private struct BodyImagesRow: View {
        var images: [CardModel.ImageModel]
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(images, id: \.self) { model in
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
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    BodySection(model: .mock)
}
