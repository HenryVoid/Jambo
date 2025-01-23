//
//  CardListView.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import SwiftUI
import ComposableArchitecture
import DesignSystem

struct CardListView: View {
    @Bindable var store: StoreOf<CardListReducer>
    
    var body: some View {
        LazyVStack {
            
        }
        .background { Color(.lightGray) }
        .searchTopBar(leftAction: {}, rightAction: {})
    }
}

extension CardListView {
    
}

#Preview {
    CardListView(store: .init(
        initialState: .init(),
        reducer: {
            CardListReducer()
        }
    ))
}
