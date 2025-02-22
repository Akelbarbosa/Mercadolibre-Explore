//
//  ProductImageView.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import SwiftUI

struct ProductImageView: View {
    let url: String
    let imageSize: CGFloat

    init(url: String, imageSize: CGFloat = .imageMedium) {
        self.url = url
        self.imageSize = imageSize
    }
    
    
    var body: some View {
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
                            .frame(width: imageSize, height: imageSize)
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
    }

    private var placeholderImage: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: imageSize, height: imageSize)
            .foregroundColor(.gray)
    }
}

#Preview {
    ProductImageView(url: "http://http2.mlstatic.com/D_702740-CBT81492251579_122024-I.jpg")
}
