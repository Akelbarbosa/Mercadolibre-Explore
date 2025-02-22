//
//  PrimaryButton.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 21/02/25.
//

import SwiftUI

struct PrimaryButton: View {
    let isDisabled: Bool 
    let title: String
    let action: () -> Void

    init(title: String, isDisabled: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.isDisabled = isDisabled
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .buttonHeight)
                .background(isDisabled ? Color.gray : Color.primaryYellow)
                .foregroundColor(Color.black)
                .cornerRadius(.cornerRadiusMedium)
        }
        .padding()
        .disabled(isDisabled)
    }
}

#Preview {
    PrimaryButton(title: "Buscar", action: {})
}
