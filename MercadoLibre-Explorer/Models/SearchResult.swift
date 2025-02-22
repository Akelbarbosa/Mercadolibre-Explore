//
//  SearchResult.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import Foundation

struct SearchResult: Decodable {
    let id: String
    let title: String
    let price: Double
    let thumbnail: String
}
