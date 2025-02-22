//
//  ProductDetailsView.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import SwiftUI

struct ProductDetailsView: View {
    var product: SearchResult

    init(product: SearchResult) {
        self.product = product
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: .marginMedium) {
                ProductHeaderView(product: product)
                AttributesTableView(attributes: product.attributes)
            }
            .padding(.horizontal, .layoutOffsetLarge)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .background(Color.primaryYellow.ignoresSafeArea())
    }
}

#Preview {
    ProductDetailsView(product: SearchResult(id: "1", title: "iPhone 15", price: 3999.99, thumbnail: "http://http2.mlstatic.com/D_702740-CBT81492251579_122024-I.jpg", attributes: []))
}
