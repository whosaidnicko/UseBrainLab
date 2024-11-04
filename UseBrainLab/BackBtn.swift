//
//  BackBtn.swift
//  UseBrainLab
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI


struct BackBtn: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("backBtn")
                 .resizable()
                 .frame(width: 40, height: 40)
        }
    }
}
