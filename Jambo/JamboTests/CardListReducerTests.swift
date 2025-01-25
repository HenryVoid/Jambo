//
//  CardListReducerTests.swift
//  JamboTests
//
//  Created by 송형욱 on 1/25/25.
//

import Testing
import ComposableArchitecture
@testable import Jambo

@MainActor
struct CardListReducerTests {

    @Test
    func 첫_진입_시_카드목록_불러내기() async throws {
        let mock = CardListDTO.Response.mock
        let store = TestStore(
            initialState: CardListReducer.State()
        ) {
            CardListReducer()
        } withDependencies: {
            $0.cardListClient.getList = { @Sendable _ in mock }
        }
        
        await store.send(.onLoad) {
            $0.initialize = true
        }
        await store.receive(\.cardListResponse) {
            $0.initialize = false
            $0.hasNext = mock.hasNext ?? false
            $0.cards = (mock.list?.compactMap { CardModel(dto: $0) })!
        }
    }

    @Test
    func 새로고침() async throws {
        let mock = CardListDTO.Response.mock
        let store = TestStore(
            initialState: CardListReducer.State(cards: [.mock])
        ) {
            CardListReducer()
        } withDependencies: {
            $0.cardListClient.getList = { @Sendable _ in mock }
        }
        
        await store.send(.onLoad) {
            $0.initialize = true
        }
        await store.receive(\.cardListResponse) {
            $0.initialize = false
            $0.hasNext = mock.hasNext ?? false
            $0.cards = (mock.list?.compactMap { CardModel(dto: $0) })!
        }
    }
    
    @Test
    func 다음_페이지_불러내기() async throws {
        let mock = CardListDTO.Response.mock
        let store = TestStore(
            initialState: CardListReducer.State(cards: [.mock])
        ) {
            CardListReducer()
        } withDependencies: {
            $0.cardListClient.getList = { @Sendable _ in mock }
        }
        
        await store.send(.nextPage)
        await store.receive(\.cardListResponse) {
            $0.initialize = false
            $0.hasNext = mock.hasNext ?? false
            $0.cards = $0.cards + (mock.list?.compactMap { CardModel(dto: $0) })!
        }
    }
}
