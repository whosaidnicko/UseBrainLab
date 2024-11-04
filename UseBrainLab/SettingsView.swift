//
//  SettingsView.swift
//  UseBrainLab
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI


struct SettingsView: View {
    var body: some View {
        ZStack {
            Image("menuBg")
                .resizable()
                .ignoresSafeArea()
            
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    if let url = URL(string: "mailto:protocastleton@gmail.com") {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                } label: {
                    ButtonText(text: "CONTACT US")
                }

               
                Button {
                    if let url = URL(string: "https://www.dropbox.com/scl/fi/s10fdc3ugui0fn4bh6kms/Untitled.paper?rlkey=1l4b23jjx523m9un4e4nnvyrl&st=nz54orhs&dl=0") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    ButtonText(text: "PRIVACY")
                }

               
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackBtn())
        .toolbar {
                  ToolbarItem(placement: .principal) {
                      StrokeText(text: "SETTINGS", width: 1, color: .white)
                          .foregroundStyle(LinearGradient(colors: [Color.init(hex: "#EC5FD1"), Color.init(hex: "#9356CF")], startPoint: .topLeading, endPoint: .bottomTrailing))
                          .font(.custom(Font.happyChicken, size: 30))
                  }
              }
    }
}
