//
//  APIResponse.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import Foundation

struct APIResponse: Decodable {
    let results: [SearchResult]
}
