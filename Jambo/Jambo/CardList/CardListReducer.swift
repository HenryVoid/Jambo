//
//  CardListReducer.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import Foundation
import ComposableArchitecture
import NetworkKit

@Reducer
struct CardListReducer {
    @Dependency(\.cardListClient) var client
    
    @ObservableState
    struct State: Equatable {
        var initialize: Bool = false
        var hasNext: Bool = false
        var cards: [CardModel] = []
    }
    
    enum Action {
        case onLoad
        case nextPage
        case cardListResponse(Result<CardListDTO.Response, Error>)
    }
    
    private enum CancelID: Hashable { case list }
    
    init() {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onLoad:
                state.initialize = true
                return .run { send in
                    await send(.cardListResponse(Result { try await client.getList(nil) }))
                }
                .cancellable(id: CancelID.list)
            case .nextPage:
                return .run { [id = state.cards.last?.id] send in
                    await send(.cardListResponse(Result { try await client.getList(id) }))
                }
                .cancellable(id: CancelID.list)
            case .cardListResponse(.success(let response)):
                state.hasNext = response.hasNext == true
                let cardModels = response.list?.compactMap { CardModel(dto: $0) } ?? []
                state.cards = state.initialize ? cardModels : state.cards + cardModels
                state.initialize = false
                return .none
            case .cardListResponse(.failure(let error)):
                Toast.shared.present(title: error.localizedDescription)
                Log.error("CardListResponse failure", error)
                return .none
            }
        }
    }
}
