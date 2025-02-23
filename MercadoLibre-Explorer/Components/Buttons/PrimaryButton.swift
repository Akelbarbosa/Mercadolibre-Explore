//
//  PrimaryButton.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 21/02/25.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let isDisabled: Bool
    let isLoading: Bool
    let action: () -> Void

    init(title: String, isDisabled: Bool = false, isLoading: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    
                } else {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .buttonHeight)
            .background((isDisabled || isLoading) ? Color.gray : Color.primaryYellow)
            .cornerRadius(.cornerRadiusMedium)
        }
        .padding()
        .disabled(isDisabled || isLoading)
    }
}

#Preview {
    PrimaryButton(title: "Buscar", action: {})
}
