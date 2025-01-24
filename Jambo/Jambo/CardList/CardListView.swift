//
//  CardListView.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import SwiftUI
import ComposableArchitecture

struct CardListView: View {
    @Bindable var store: StoreOf<CardListReducer>
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 12) {
                ForEach(store.cards) { card in
                    Card(model: card, connectTap: {})
                }
            }
            .padding(12)
        }
        .refreshable {
            store.send(.onLoad)
        }
        .background(.lineLight)
        .searchTopBar(leftItemTap: {}, rightItemTap: {})
        .task {
            store.send(.onLoad)
        }
    }
}

#Preview {
    CardListView(store: .init(
        initialState: .init(),
        reducer: {
            CardListReducer()
        }
    ))
}
