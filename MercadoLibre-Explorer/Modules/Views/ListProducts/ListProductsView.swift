//
//  ListProductsView.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import SwiftUI

struct ListProductsView: View {
    let query: String
    let results: [SearchResultEntity]
    
    var body: some View {
        NavigationStack {
            VStack {
                List(results, id: \.id) { product in
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                        ProductCell(url: product.thumbnail,
                                    title: product.title,
                                    price: PriceFormatter.format(product.price))
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusMedium))
                        .padding(.vertical, .marginMedium)
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .padding(.horizontal, .layoutOffsetXLarge)
            .background(Color(.systemGray6))
            .scrollContentBackground(.hidden)
            .navigationTitle("Resultados")
            .scrollIndicators(.hidden)
        }
        .tint(.black)
    }
}

#Preview {
    let products = [
        SearchResultEntity(id: "1", title: "iPhone 15", price: 3999.99, thumbnail: "http://http2.mlstatic.com/D_702740-CBT81492251579_122024-I.jpg", attributes: []),
        SearchResultEntity(id: "2", title: "MacBook Pro", price: 7999.99, thumbnail: "https://http2.mlstatic.com/D_NQ_NP_2X_913372-MLA50099941835_072023-F.jpg", attributes: []),
        SearchResultEntity(id: "3", title: "AirPods Pro", price: 249.99, thumbnail: "https://http2.mlstatic.com/D_NQ_NP_2X_913372-MLA20941835_072023-F.jpg", attributes: [])
    ]

    return ListProductsView(query: "iPhone", results: products)
}
