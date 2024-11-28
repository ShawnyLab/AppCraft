//
//  SignInView.swift
//  FeatureAuth
//
//  Created by Shawn on 11/27/24.
//

import SwiftUI
import CoreUI
import ComposableArchitecture
import AuthenticationServices

public struct SignInView: View {
    private let store: StoreOf<FeatureAuth>
    
    public init(store: StoreOf<FeatureAuth> = Store(initialState: FeatureAuth.State()) {
        FeatureAuth()
    }) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Join AppCraft")
                        .font(ACFont.custom(32, weight: .bold))
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                }

                CoreUIAsset
                    .guideLogo
                    .swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(.vertical, 40)
                    .padding(.bottom, 20)
                
                CoreUIAsset
                    .googleSignin
                    .swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 50)
                
                SignInWithAppleButton { request in
                    //TODO: signin
                } onCompletion: { result in
                    
                }
                .scaledToFit()
                .padding(.horizontal, 50)
                
                // Error Message
                if let error = viewStore.error {
                    Text(error.localizedDescription)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                viewStore.send(.checkAuthenticationStatus)
            }
            .background(Color.white)
        }
    }
}


//#Preview {
//    SignInView()
//}
