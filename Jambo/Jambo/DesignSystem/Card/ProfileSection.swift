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
                
                Text(contents)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundStyle(.textLight)
            }
            
            Spacer()
        }
    }
    
    private var contents: String {
        let time = TimeInterval(model.createdAt) / 1000.0
        let dateTime = Date(timeIntervalSince1970: time).compare(from: Date())
        let distance = LocationManager.shared.distance(latitude: model.latitude, longitude: model.longitude)
        return distance + dateTime
    }
}

#Preview {
    ProfileSection(model: .mock)
}
