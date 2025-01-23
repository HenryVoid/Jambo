//
//  ConnectSection.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI

struct ConnectModel: Sendable, Hashable {
    var status: String
    var userCount: Int
    var messageList: [MessageModel]
}

struct MessageModel: Sendable, Hashable, Identifiable {
    enum TYPE: Hashable {
        case text(String)
        case image
    }
    let id = UUID()
    var type: TYPE
    var nickName: String
    var profileImage: ImageModel
    var dateTime: String
}

struct ConnectSection: View {
    var model: ConnectModel
    var connectTap: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            if model.messageList.isEmpty {
                Text("You can talk to me.😀")
                    .font(.system(size: 13))
                    .fontWeight(.regular)
                    .foregroundStyle(.textDefault)
            }
            
            Button {
                connectTap()
            } label: {
                RoundedRectangle(cornerRadius: 13.6)
                    .fill(.buttonPrimary)
                    .overlay {
                        HStack(spacing: 4) {
                            Image(.icConnectButton)
                            
                            Text("Connect")
                                .font(.system(size: 13))
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                    }
                    .frame(height: 34)
            }
        }
    }
}

#Preview {
    ConnectSection(model: .init(
        status: "Connecting",
        userCount: 2,
        messageList: []
    ))
}
