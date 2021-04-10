//
//  WinView.swift
//  demoo
//
//  Created by User24 on 2021/4/10.
//  Copyright © 2021 yuen. All rights reserved.
//
import SwiftUI

struct winView: View {
    @Binding var PlayPage: Bool
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("CONGRATULATION")
                Text("You Have Completed All Words")
            }
        }
        .overlay(
            Button(action: {
                self.PlayPage = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(20)
            }), alignment: .topTrailing)
    }
}
