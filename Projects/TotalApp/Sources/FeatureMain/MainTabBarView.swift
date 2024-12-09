//
//  MainTabBarView.swift
//  FeatureMain
//
//  Created by Shawn on 12/8/24.
//

import SwiftUI
import Shared
import AppCraftCoreUI
import FeatureBoard
import DomainBoardInterface
import ComposableArchitecture

public struct MainTabBarView: View {

    @Bindable var store: StoreOf<FeatureMain>
    let domainBoard: DomainBoardInterface
    
    public var body: some View {
        VStack {
            switch store.currentTab {
            case .board:
                BoardListView(domain: domainBoard, userID: store.userID ?? "")
            case .comps:
                VStack {
                    
                }
            case .apps:
                VStack {
                    
                }
            case .social:
                VStack {
                    
                }
            }
            Spacer(minLength: 0)
            
            if !store.hideTabBar {
                HStack {
                    ForEach(AppCraftTab.allCases) { tab in
                        Button {
                            store.send(.changeTab(tab))
                        } label: {
                            ZStack {
                                Color.clear
                                
                                VStack {
                                    tab.image.resizable()
                                        .scaledToFit()
                                        .frame(width: 45)
                                    
                                    Text(tab.title)
                                        .font(ACFont.custom(17, weight: store.currentTab == tab ? .semibold : .light))
                                        .foregroundStyle(Color.black)
                                }
                            }
                            .frame(height: 55)
                            .opacity(store.currentTab == tab ? 1 : 0.3)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}


extension AppCraftTab {
    var title: String {
        switch self {
        case .board:
            return "Board"
        case .comps:
            return "Comps"
        case .apps:
            return "Apps"
        case .social:
            return "Social"
        }
    }
    
    var image: Image {
        switch self {
        case .board:
            return AppCraftCoreUIAsset
                .icBoardBlack
                .swiftUIImage
        case .comps:
            return AppCraftCoreUIAsset
                .icCompBlack
                .swiftUIImage
        case .apps:
            return AppCraftCoreUIAsset
                .icAppBlack
                .swiftUIImage
        case .social:
            return AppCraftCoreUIAsset
                .icSocialBlack
                .swiftUIImage
        }
    }
}
