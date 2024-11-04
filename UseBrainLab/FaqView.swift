//
//  FaqView.swift
//  UseBrainLab
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI

struct FaqView: View {
    var body: some View {
        ZStack {
            Image("menuBg")
                .resizable()
                .ignoresSafeArea()
            
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            Text("""
                 The Brain Lab is a horizontal endless running game set in a
                 laboratory. Help the crazy-haired scientist collect objects in the states of matter he needs.
                 """)
            .font(.custom(Font.happyChicken, size: 30))
            .foregroundStyle(.white)
            .padding(.horizontal, 40)
            .multilineTextAlignment(.center)
        }
        .navigationBarBackButtonHidden()
        
        .navigationBarItems(leading: BackBtn())
        .toolbar {
                  ToolbarItem(placement: .principal) {
                      StrokeText(text: "RULES", width: 1, color: .white)
                          .foregroundStyle(LinearGradient(colors: [Color.init(hex: "#EC5FD1"), Color.init(hex: "#9356CF")], startPoint: .topLeading, endPoint: .bottomTrailing))
                          .font(.custom(Font.happyChicken, size: 30))
                  }
              }
    }
}
