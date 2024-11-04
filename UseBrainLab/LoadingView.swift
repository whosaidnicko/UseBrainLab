//
//  LoadingView.swift
//  UseBrainLab
//
//  Created by Nicolae Chivriga on 04/11/2024.
//

import SwiftUI


struct LoadingView: View {
    @State var loadingFinished: Bool = false
    @State var goToMenu: Bool = false
    var body: some View {
        ZStack {
            Image("backgroundL")
                .resizable()
                .ignoresSafeArea()
            
            NavigationLink("", destination: MenuView(), isActive: $goToMenu)
            VStack {
                StrokeText(text: "LOADING...", width: 2, color: .white)
                    .foregroundStyle(LinearGradient(colors: [Color.init(hex: "#EC5FD1"), Color.init(hex: "#9356CF")], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .font(.custom(Font.happyChicken, size: 40))
            }
            
            VStack {
                Spacer()
                
                loadingView()
            }
            .padding()
        }
        .onAppear() {
            withAnimation(Animation.linear(duration: 2)) {
                loadingFinished = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                goToMenu = true
            }
        }
    }
    
    func loadingView() -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .overlay(alignment: .leading) {
                
                    RoundedRectangle(cornerRadius: 25)
                        .trim(from: self.loadingFinished ? 1 : 0, to: 1)
                        .fill(LinearGradient(colors: [Color.init(hex: "#EC5FD1"), Color.init(hex: "#9356CF")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: 35)
                        .padding(.horizontal)
                
                    
            }
            .frame(height: 43)
            .padding(.horizontal)
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Font  {
    static var happyChicken: String = "HappyChicken"
}
