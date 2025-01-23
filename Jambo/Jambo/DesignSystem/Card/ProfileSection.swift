//
//  ProfileSection.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct ProfileModel: Sendable, Hashable {
    var nickname: String
    var contents: String
    var image: ImageModel
}

struct ProfileSection: View {
    var model: ProfileModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            ProfileImageView(model: model.image)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(model.nickname)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.textDefault)
                
                Text(model.contents)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(.textLight)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ProfileSection(model: .init(nickname: "Tiffany", contents: "1km 1m ago", image: .init(width: 40, height: 40, url: "https://jambo-homework.s3.ap-northeast-2.amazonaws.com/thumbnail/Thumbnail_8.png")))
}
