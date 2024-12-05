//
//  MainTabBarView.swift
//  AppCraft
//
//  Created by Shawn on 12/5/24.
//

import SwiftUI
import Shared
import AppCraftCoreUI
import FeatureBoard
import DomainBoardInterface

struct MainTabBarView: View {
    @EnvironmentObject private var appState: AppState
    let domainBoard: DomainBoardInterface
    
    init(domainBoard: DomainBoardInterface) {
        self.domainBoard = domainBoard
    }
    
    var body: some View {
        VStack {
            switch appState.currentTab {
            case .board:
                BoardListView(domain: domainBoard, userID: appState.userID ?? "")
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
            
            HStack {
                ForEach(AppCraftTab.allCases) { tab in
                    Button {
                        appState.currentTab = tab
                    } label: {
                        ZStack {
                            Color.clear
                            
                            VStack {
                                tab.image.resizable()
                                    .scaledToFit()
                                    .frame(width: 45)
                                
                                Text(tab.title)
                                    .font(ACFont.custom(17, weight: .semibold))
                                    .foregroundStyle(Color.black)
                            }
                        }
                        .frame(height: 55)
                        .opacity(appState.currentTab == tab ? 1 : 0.5)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

//#Preview {
//    VStack {
//        MainTabBarView()
//    }
//    .environmentObject(AppState())
//}

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
