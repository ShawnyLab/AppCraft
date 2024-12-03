//
//  ExampleView.swift
//  FeatureCompExample
//
//  Created by Shawn on 11/29/24.
//

import SwiftUI
import FeatureComp
import AppCraftCoreUI
import Shared
import MockDomainComp
import DomainCompInterface

struct ExampleView: View {
    static let domainComp: DomainCompInterface = MockDomainComp()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("FeatureCompExampleApp")
                    .font(.title)
                
                NavigationLink {
                    ZStack {
                        AppCraftCoreUIAsset.gray1.swiftUIColor
                        
                        CompListView(domainComp: Self.domainComp)
                    }
                } label: {
                    HStack {
                        Text("컴포넌트 목록 화면")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                }
                
                NavigationLink {
                    ZStack {
                        Color.white
                        
                        CompView(comp: Comp.mock)
                    }
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
