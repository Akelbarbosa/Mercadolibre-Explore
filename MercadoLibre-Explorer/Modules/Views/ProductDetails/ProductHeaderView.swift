//
//  ProductHeaderView.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import SwiftUI

struct ProductHeaderView: View {
    var product: SearchResultEntity

    var body: some View {
        VStack(spacing: .marginMedium) {
            Text(product.title)
                .font(.headline)
                .foregroundStyle(Color.black)
                .padding(.top, .marginMedium)
                .frame(maxWidth: .infinity, alignment: .leading)

            ProductImageView(url: product.thumbnail)
                .frame(maxWidth: .infinity)
                .aspectRatio(4/3, contentMode: .fit)

            Text(PriceFormatter.format(product.price))
                .font(.title3)
                .foregroundStyle(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
