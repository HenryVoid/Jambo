//
//  ConnectSection.swift
//  Jambo
//
//  Created by 송형욱 on 1/23/25.
//

import SwiftUI


struct ConnectSection: View {
    var model: CardModel.ConnectModel
    var connectTap: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            if model.messageList.isEmpty {
                emptyText()
            } else {
                commentSection()
            }
            connectButton()
        }
    }
}

extension ConnectSection {
    @ViewBuilder
    private func emptyText() -> some View {
        Text("You can talk to me.😀")
            .font(.system(size: 13))
            .fontWeight(.regular)
            .foregroundStyle(.textDefault)
    }
    
    @ViewBuilder
    private func commentSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Image(.icTalkPeople)
                Text(model.userCount.formatted())
                    .fontWeight(.semibold)
                Text("people are talking")
                    .fontWeight(.regular)
                
                Spacer()
            }
            .font(.system(size: 13))
            .foregroundStyle(.secondary50)
            
            ForEach(model.messageList) { message in
                CommentRow(model: message)
            }
        }
    }
    
    private struct CommentRow: View {
        var model: CardModel.MessageModel
        var body: some View {
            HStack(spacing: 4) {
                ProfileImageView(model: model.profileImage)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(model.nickName)
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundStyle(.textDefault)
                    
                    HStack(spacing: 4) {
                        switch model.type {
                        case .text(let string):
                            Text(string)
                                .font(.system(size: 13))
                                .fontWeight(.regular)
                                .foregroundStyle(.textDefault)
                                .lineLimit(1)
                        case .image:
                            Image(.icPrepareImageMessage)
                        }
                        
                        Text(model.dateTime)
                            .font(.system(size: 12))
                            .fontWeight(.regular)
                            .foregroundStyle(.textLighter)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func connectButton() -> some View {
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

#Preview {
    ConnectSection(model: .mock, connectTap: {})
}
