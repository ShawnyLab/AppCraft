//
//  CounterView.swift
//  AppCraftKit
//
//  Created by Shawn on 11/9/24.
//

//import SwiftUI
//import ComposableArchitecture
//import AppCraftKit
//
//public struct CounterView: View {
//    let store: StoreOf<CounterFeature>
//    
//    public init(store: StoreOf<CounterFeature>) {
//        self.store = store
//    }
//    
//    public var body: some View {
//        WithViewStore(self.store, observe: { $0 }) { viewStore in
//            VStack {
//                Text("\(viewStore.count)")
//                    .font(.largeTitle)
//                    .padding()
//                
//                HStack {
//                    Button {
//                        viewStore.send(.decrementButtonTapped)
//                    } label: {
//                        Image(systemName: "minus.circle.fill")
//                            .font(.title)
//                    }
//                    .padding()
//                    
//                    Button {
//                        viewStore.send(.incrementButtonTapped)
//                    } label: {
//                        Image(systemName: "plus.circle.fill")
//                            .font(.title)
//                    }
//                    .padding()
//                }
//                
//                Button("Number Fact") {
//                    viewStore.send(.numberFactButtonTapped)
//                }
//                .buttonStyle(.borderedProminent)
//                .padding()
//            }
//            .alert(
//                "Number Fact",
//                isPresented: viewStore.binding(
//                    get: { $0.numberFactAlert != nil },
//                    send: .factAlertDismissed
//                ),
//                actions: { Button("OK") { viewStore.send(.factAlertDismissed) } },
//                message: { Text(viewStore.numberFactAlert ?? "") }
//            )
//        }
//    }
//}
