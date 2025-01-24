//
//  Card.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct Card: View {
    var model: CardModel
    var connectTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProfileSection(model: model.profile)
            BodySection(model: model.body)
            
            Line().frame(height: 0.5).background(.lineLight)
                .padding(.vertical, 12)
            
            ConnectSection(model: model.connect, connectTap: connectTap)
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Card(model: .mock, connectTap: {})
}
