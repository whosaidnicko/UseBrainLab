//
//  MenuView.swift
//  UseBrainLab
//
//  Created by Nicolae Chivriga on 04/11/2024.
//


import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Image("menuBg")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image("settings")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        FaqView()
                    } label: {
                        Image("faq")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                }
                Spacer()
                NavigationLink {
                    BrainGameView()
                } label: {
                    ButtonText(text: "PLAY")
                }

               
            }
            .padding()
            
            Image("enstbn")
                .resizable()
                .frame(width: 300, height: 250)
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            AppDelegate.eroskei = .portrait
        }
        
    }
}
