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
        var cards: [CardModel] = []
    }
    
    enum Action {
        case onLoad
        case cardListResponse(Result<CardListDTO.Response, Error>)
    }
    
    private enum CancelID: Hashable { case list }
    
    init() {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onLoad:
                return .run { send in
                    await send(.cardListResponse(Result { try await client.getList() }))
                }
                .cancellable(id: CancelID.list)
            case .cardListResponse(.success(let response)):
                state.cards = response.list?.compactMap {
                    CardModel(dto: $0)
                } ?? []
                return .none
            case .cardListResponse(.failure(let error)):
                Toast.shared.present(title: error.localizedDescription)
                Log.error("CardListResponse failure", error)
                return .none
            }
        }
    }
}
