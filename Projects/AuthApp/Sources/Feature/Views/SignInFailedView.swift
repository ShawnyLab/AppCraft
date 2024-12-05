//
//  GoogleSignInFailedView.swift
//  FeatureAuth
//
//  Created by Shawn on 11/29/24.
//

import SwiftUI
import AppCraftCoreUI
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
                    .foregroundStyle(Color.black)
                
                Spacer()
            }

            VStack {
                Text("Unable to sign in with \(method.text)")
                
                Text("Please try again")
            }
            .foregroundStyle(Color.black)
            .font(ACFont.custom(18))
            .frame(height: 100)
            .padding(.vertical, 40)
            .padding(.bottom, 20)
            
            Button {
                
            } label: {
                HStack {
                    AppCraftCoreUIAsset
                        .icGoogle
                        .swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                    
                    Text("Sign in with Google")
                        .font(ACFont.custom(18))
                        .opacity(0.8)
                    
                    Spacer()
                    
                    Color.clear
                        .frame(width: 20, height: 20)
                }
                .padding(.horizontal)
                .frame(height: 48)
                .background(
                    Color.black
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.horizontal, 40)
            
            Button {
                
            } label: {
                HStack {
                    AppCraftCoreUIAsset
                        .icApple
                        .swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                    
                    Text("Sign in with Apple")
                        .font(ACFont.custom(18))
                        .opacity(0.8)
                    
                    Spacer()
                    
                    Color.clear
                        .frame(width: 20, height: 20)
                }
                .padding(.horizontal)
                .frame(height: 48)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.horizontal, 40)
            .padding(.top, 10)

            
            Spacer()
        }
        .padding()
        .foregroundStyle(Color.white)
        .background(Color.white)
    }
}

#Preview {
    SignInFailedView(method: .apple)
}
