//
//  CardModel.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

struct CardModel: Sendable, Hashable, Identifiable {
    let id, type: String
    let profile: ProfileModel
    let body: BodyModel
    let connect: ConnectModel
}

extension CardModel {
    static let mock: Self = .init(
        id: "678c8ad6b46da5a352066dd6",
        type: "POST",
        profile: .mock,
        body: .mock,
        connect: .mock
    )
}
