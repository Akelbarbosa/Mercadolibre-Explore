//
//  MercadoLibreAPI.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import Foundation

class MercadoLibreAPI {
    static let shared = MercadoLibreAPI()
    
    private let baseURL = "https://api.mercadolibre.com/sites/MLA/search?q="
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func search(query: String) async throws -> [SearchResult] {
        guard let url = URL(string: "\(baseURL)\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            return decodedResponse.results
        } catch {
            throw APIError.decodingFailed
        }
    }
}
