//
//  CardModel.swift
//  Jambo
//
//  Created by 송형욱 on 1/24/25.
//

import Foundation

struct CardModel: Sendable, Hashable, Identifiable {
    let id: String
    let profile: ProfileModel
    let body: BodyModel
    let connect: ConnectModel
    
    init(id: String, profile: ProfileModel, body: BodyModel, connect: ConnectModel) {
        self.id = id
        self.profile = profile
        self.body = body
        self.connect = connect
    }
    
    init?(dto response: CardListDTO.List?) {
        guard let response,
              let card = response.card,
              let cardID = card.cardID,
              let profile = ProfileModel(dto: response.profile, createdAt: response.card?.createdAt),
        let body = BodyModel(dto: response.card),
        let connect = ConnectModel(dto: response.card?.connect) else {
            return nil
        }
        self.id = cardID
        self.profile = profile
        self.body = body
        self.connect = connect
    }
}

extension CardModel {
    static let mock: Self = .init(
        id: "678c8ad6b46da5a352066dd6",
        profile: .mock,
        body: .mock,
        connect: .mock
    )
}
