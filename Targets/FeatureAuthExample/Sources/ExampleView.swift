//
//  ExampleView.swift
//  FeatureAuthExample
//
//  Created by Shawn on 11/29/24.
//

import SwiftUI
import FeatureAuth

struct ExampleView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("FeatureAuthExampleApp")
                    .font(.title)
                
                NavigationLink {
                    SignInView()
                        
                } label: {
                    HStack {
                        Text("로그인 화면")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }

                NavigationLink {
                    SignInView()
                } label: {
                    HStack {
                        Text("구글 로그인 성공")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }
                
                NavigationLink {
                    SignInFailedView(method: .google)
                } label: {
                    HStack {
                        Text("구글 로그인 실패")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }
                
                NavigationLink {
                    SignInView()
                } label: {
                    HStack {
                        Text("애플 로그인 성공")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }
                
                NavigationLink {
                    SignInFailedView(method: .apple)
                } label: {
                    HStack {
                        Text("애플 로그인 실패")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }
                
                Spacer()
            }
            .foregroundStyle(Color.black)
            .background(Color.white)
        }
    }
}
