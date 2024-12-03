//
//  ExampleView.swift
//  FeatureCompExample
//
//  Created by Shawn on 11/29/24.
//

import SwiftUI
import FeatureBoard
import AppCraftCoreUI
import Shared
import MockDomainBoard
import DomainBoardInterface

struct ExampleView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("FeatureBoardExampleApp")
                    .font(.title)
                
                NavigationLink {
                    ZStack {
                        Color.white
                        
                        BoardListView(domain: MockDomainBoard())
                    }
                } label: {
                    HStack {
                        Text("보드 목록 화면")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }

                NavigationLink {

                } label: {
                    HStack {
                        Text("컴포넌트 생성 화면")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }
                
                NavigationLink {

                } label: {
                    HStack {
                        Text("싱글 컴포넌트 화면")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }
                
                NavigationLink {
                    
                } label: {
                    HStack {
                        Text("컴포넌트 수정")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }
                
                NavigationLink {
                    
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
