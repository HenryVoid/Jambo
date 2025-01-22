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
        
    }
    
    enum Action {
        case onLoad
        case cardListResponse(Result<CardListDTO.Response, API.Error>)
    }
    
    private enum CancelID: Hashable { case list }
    
    init() {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onLoad:
                return .run { send in
                    let response = try await client.getList()
                    await send(.cardListResponse(Result { response }))
                }
                .cancellable(id: CancelID.list)
            case .cardListResponse(.success(let response)):
                // TODO: State 로 맵핑
                Log.debug("CardListResponse Success", response)
                return .none
            case .cardListResponse(.failure(let error)):
                // TODO: Error 처리
                Log.debug("CardListResponse failure", error)
                return .none
            }
        }
    }
}
