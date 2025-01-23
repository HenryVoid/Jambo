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
        Button {
            store.send(.onLoad)
        } label: {
            Text("API")
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
