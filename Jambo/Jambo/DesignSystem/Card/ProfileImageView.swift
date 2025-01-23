//
//  ProfileImageView.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct ImageModel: Sendable, Hashable, Identifiable {
    let id = UUID()
    var width: CGFloat
    var height: CGFloat
    var url: String
}

struct ProfileImageView: View {
    var model: ImageModel
    
    var body: some View {
        CacheAsyncImage(
            url: URL(string: model.url),
            content: { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: model.width, height: model.height)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            },
            placeholder: {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.black, lineWidth: 1.0)
                    .frame(width: model.width, height: model.height)
            }
        )
    }
}

#Preview {
    ProfileImageView(model: .init(width: 40, height: 40, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_8.png"))
}
