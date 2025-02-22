//
//  ProductCell.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import SwiftUI

import SwiftUI

struct ProductCell: View {
    private let url: String
    private let title: String
    private let price: String
    let imageSize: CGFloat = 150

    init(url: String, title: String, price: String) {
        self.url = url
        self.title = title
        self.price = price
    }

    var body: some View {
        HStack(spacing: .marginMedium) {
            ZStack {
                RoundedRectangle(cornerRadius: .cornerRadiusMedium)
                    .frame(width: imageSize, height: imageSize)
                    .foregroundColor(Color.clear)

                if let validURL = URL(string: url.replacingOccurrences(of: "http://", with: "https://")),
                   !url.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    
                    AsyncImage(url: validURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)

                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: imageSize, height: imageSize )
                                .clipShape(RoundedRectangle(cornerRadius: .cornerRadiusMedium))

                        case .failure:
                            placeholderImage

                        @unknown default:
                            placeholderImage
                        }
                    }
                    
                } else {
                    placeholderImage
                }
            }

            VStack(alignment: .leading, spacing: .marginMedium) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(Color(.darkGray))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(price)
                    .font(.callout)
                    .foregroundStyle(Color.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var placeholderImage: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: imageSize, height: imageSize)
            .foregroundColor(.gray)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProductCell(url: "http://http2.mlstatic.com/D_702740-CBT81492251579_122024-I.jpg", title: "Nombre del producto", price: "$ 2.000.000")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
