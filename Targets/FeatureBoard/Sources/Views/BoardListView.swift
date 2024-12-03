//
//  BoardListView.swift
//  AppCraft
//
//  Created by Shawn on 12/2/24.
//

import SwiftUI
import ComposableArchitecture
import DomainBoardInterface
import AppCraftCoreUI

public struct BoardListView: View {
    private let store: StoreOf<FeatureBoard>

    public init(domain: DomainBoardInterface) {
        self.store = Store(initialState: FeatureBoard.State(), reducer: {
            FeatureBoard(domainBoard: domain)
        })
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                if viewStore.boards.isEmpty {
                    Button {
                        
                    } label: {
                        AppCraftCoreUIAsset
                            .darkGray
                            .swiftUIColor
                            .frame(width: 165, height: 165)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(
                                color: Color.black.opacity(0.25),
                                radius: 4,
                                x: 0,
                                y: 4
                            )
                            .overlay {
                                VStack(spacing: 0) {
                                    AppCraftCoreUIAsset
                                        .icBoardWhite
                                        .swiftUIImage
                                    
                                    Text("New Board")
                                        .font(ACFont.custom(20))
                                        .foregroundStyle(Color.white)
                                        .padding(.top, 25)
                                    
                                    AppCraftCoreUIAsset
                                        .icPlusWhite
                                        .swiftUIImage
                                        .padding(.top, 7)
                                }

                            }
                    }

                } else {
                    LazyVGrid(columns: [GridItem(spacing: 12), GridItem(spacing: 12)]) {
                        ForEach(viewStore.boards) { board in
                            SingleBoardView(board: board)
                        }
                    }
                    .padding(.horizontal, 12)
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
