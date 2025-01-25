//
//  CategoryRow.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct CategoryRow: View {
    var category: CardModel.CategoryModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            CacheAsyncImage(
                url: URL(string: category.imageURL),
                content: { image in
                    image.resizable()
                        .frame(width: 14, height: 14)
                },
                placeholder: {
                    Circle()
                        .stroke(.black, lineWidth: 1.0)
                        .frame(width: 14, height: 14)
                        .redacted(reason: .placeholder)
                }
            )
            
            Text(category.name)
                .font(.system(size: 13))
                .fontWeight(.semibold)
                .foregroundStyle(.textDefault)
        }
    }
}

#Preview {
    CategoryRow(category: .mock)
}
