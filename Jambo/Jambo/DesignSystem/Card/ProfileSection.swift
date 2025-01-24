//
//  ProfileSection.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct ProfileSection: View {
    var model: CardModel.ProfileModel
    
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
    ProfileSection(model: .mock)
}
