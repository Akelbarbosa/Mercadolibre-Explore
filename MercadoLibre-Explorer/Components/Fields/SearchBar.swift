//
//  SearchBar.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    let placeholder: String

    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }

    var body: some View {
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity)
            .padding(.marginMedium)
            .background(Color(.systemGray6))
            .cornerRadius(.cornerRadiusMedium)
            .padding(.horizontal)
            .foregroundColor(.primary)
            .tint(.primary)
    }
}
#Preview {
    struct PreviewContainer: View {
        @State private var query = ""

        var body: some View {
            SearchBar(text: $query, placeholder: "Buscar en MercadoLibre...")
        }
    }

    return PreviewContainer()
}
