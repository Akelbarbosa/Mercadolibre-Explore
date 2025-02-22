//
//  AttributeRowView.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import SwiftUI

struct AttributeRowView: View {
    var attribute: ProductAttribute
    var isGray: Bool

    var body: some View {
        HStack {
            Text(attribute.name)
                .font(.footnote)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(attribute.valueName ?? "")
                .font(.footnote)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .background(isGray ? Color.gray.opacity(0.2) : Color.white)
    }
}
