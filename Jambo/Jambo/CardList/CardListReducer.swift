//
//  CardListReducer.swift
//  Jambo
//
//  Created by 송형욱 on 1/22/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct CardListReducer {
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        
    }
    
    private enum CancelID: Hashable { case list }
    
    init() {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            
            }
        }
    }
}
