//
//  FeatureMain.swift
//  FeatureMain
//
//  Created by Shawn on 12/8/24.
//

import ComposableArchitecture
import Shared

@Reducer
struct FeatureMain {

    @ObservableState
    struct State {
        var currentTab: AppCraftTab = .board
        var hideTabBar = false
        var userID: String? = nil
    }

    enum Action {
        case onAppear
        case changeTab(AppCraftTab)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none

            case .changeTab(let tab):
                state.currentTab = tab
                return .none
            }
        }
    }
}
