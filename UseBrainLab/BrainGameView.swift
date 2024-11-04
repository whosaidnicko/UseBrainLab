//
//  BrainGameView.swift
//  UseBrainLab
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI

struct BrainGameView: View {
    @State var rotationGoing: Bool = false
    @State var showGame: Bool = false
    var body: some View {
        ZStack {
            Image("backgroundL")
                .resizable()
                .ignoresSafeArea()
            
            Image("enstbn")
                .resizable()
                .frame(width: 300, height: 250)
                .rotationEffect(.degrees(rotationGoing ? 2000 : 0))
                .animation(Animation.linear(duration: 20), value: rotationGoing)
            
            WKWebViewRepresentable(url: URL(string: "https://plays.org/game/the-brain-lab/")!)
//                .frame(width: 400, height: 300)
                .cornerRadius(20)
                .opacity(showGame ? 1 : 0)
                
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackBtn())
        .onAppear() {
            rotationGoing = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                showGame = true 
            }
        }
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//               
//            }
//        }
        .onAppear() {
            AppDelegate.eroskei = .landscape
        }
    }
}
