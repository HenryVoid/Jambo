//
//  CategoryRow.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct CategoryModel: Sendable, Hashable {
    let name: String
    let imageURL: String
}

struct CategoryRow: View {
    var category: CategoryModel
    
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
    CategoryRow(category: .init(name: "Talk & Listen", imageURL: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/categroy/Talk%26Listen.png"))
}
