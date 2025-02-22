//
//  ListProductsView.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import SwiftUI

struct ListProductsView: View {
    let query: String
    let results: [SearchResult]

    var body: some View {
        List(results, id: \.id) { product in
            navigationLink(for: product)
        }
        .navigationTitle(query)
    }

    @ViewBuilder
    private func navigationLink(for product: SearchResult) -> some View {
        NavigationLink(destination: ProductDetailsView(product: product)) {
            ProductCell(url: product.thumbnail, title: product.title, price: "\(product.price)")
        }
    }
}

#Preview {
    let products = [
        SearchResult(id: "1", title: "iPhone 15", price: 3999.99, thumbnail: "http://http2.mlstatic.com/D_702740-CBT81492251579_122024-I.jpg", attributes: []),
        SearchResult(id: "2", title: "MacBook Pro", price: 7999.99, thumbnail: "https://http2.mlstatic.com/D_NQ_NP_2X_913372-MLA50099941835_072023-F.jpg", attributes: []),
        SearchResult(id: "3", title: "AirPods Pro", price: 249.99, thumbnail: "https://http2.mlstatic.com/D_NQ_NP_2X_913372-MLA20941835_072023-F.jpg", attributes: [])
    ]

    return ListProductsView(query: "iPhone", results: products)
}
