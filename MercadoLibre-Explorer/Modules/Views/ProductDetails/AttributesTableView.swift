//
//  AttributesTableView.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import SwiftUI

struct AttributesTableView: View {
    var attributes: [ProductAttribute]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(attributes.enumerated()), id: \.element.id) { index, attribute in
                AttributeRowView(attribute: attribute, isGray: index.isMultiple(of: 2))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.vertical, .marginMedium)
    }
}
