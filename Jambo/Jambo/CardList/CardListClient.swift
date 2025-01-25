//
//  CardListClient.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import Foundation
import DependenciesMacros
import Dependencies
import NetworkKit

@DependencyClient
struct CardListClient {
    var getList: @Sendable (_ id: String?) async throws -> CardListDTO.Response
}

extension CardListClient: TestDependencyKey {
    static let testValue = Self()
}

extension CardListClient: DependencyKey {
    static let liveValue: CardListClient = .init(
        getList: { id in
            let endpoint = CardListEndpoint.getCardList(id: id)
            return try await API.Client.shared.request(endpoint, decode: CardListDTO.Response.self)
        }
    )
}

extension DependencyValues {
    var cardListClient: CardListClient {
        get { self[CardListClient.self] }
        set { self[CardListClient.self] = newValue }
    }
}
