//
//  GoogleSignInFailedView.swift
//  FeatureAuth
//
//  Created by Shawn on 11/29/24.
//

import SwiftUI
import CoreUI
import AuthenticationServices

public struct SignInFailedView: View {
    private var method: Method
    
    public init(method: Method) {
        self.method = method
    }
    
    public enum Method: String {
        case google, apple
        
        var text: String {
            switch self {
            case .google:
                return "Google"
            case .apple:
                return "Apple"
            }
        }
    }
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Text("Sorry !")
                    .font(ACFont.custom(32, weight: .bold))
                
                Spacer()
            }

            VStack {
                Text("Unable to sign in with \(method.text)")
                
                Text("Please try again")
            }
            .font(ACFont.custom(18))
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

            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .foregroundStyle(Color.black)
    }
}
