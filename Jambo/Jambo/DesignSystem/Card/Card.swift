//
//  Card.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct CardModel: Sendable, Hashable, Identifiable {
    let id, type: String
    let profile: ProfileModel
    let body: BodyModel
}

struct Card: View {
    var model: CardModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProfileSection(model: model.profile)
            BodySection(model: model.body)
            
            Line().frame(height: 0.5)
                .background { Color(.lineLight) }
        }
        .padding(16)
    }
}

#Preview {
    Card(model: .init(
        id: "678c8ad6b46da5a352066dd6",
        type: "POST",
        profile: .init(nickname: "Tiffany", contents: "1km 1m ago", image: .init(width: 40, height: 40, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_8.png")),
        body: .init(
            category: .init(name: "Talk & Listen", imageURL: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/categroy/Talk%26Listen.png"),
            contents: "Jill said Tony informed his children they were being disinherited, but in a separate interview, his daughter Allegra Curtis told Inside Edition she and her siblings were “blindsided” by the move and claimed her father washis children they were being disinherited, but in a separate interview, his daughter Allegra Curtis told Inside Edition she and her siblings were “blindsided” by the move and claimed her father was",
            images: [
                .init(width: 334, height: 334, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_0.png"),
                .init(width: 334, height: 334, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_0.png"),
                .init(width: 334, height: 334, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/image/image_0.png"),
            ]
        )
    ))
}
