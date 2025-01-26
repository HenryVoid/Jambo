//
//  ProfileImageView.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct ProfileImageView: View {
    var model: CardModel.ImageModel
    
    @State private var blinking: Bool = false
    
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
                    .fill(.lineLight)
                    .frame(width: model.width, height: model.height)
                    .opacity(blinking ? 0.3 : 1)
                    .animation(.easeInOut(duration: 1).repeatForever(), value: blinking)
                    .onAppear {
                        blinking.toggle()
                    }
            }
        )
    }
}

#Preview {
    ProfileImageView(model: .mock)
}
