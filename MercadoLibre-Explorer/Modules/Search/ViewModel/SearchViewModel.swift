//
//  SearchViewModel.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 21/02/25.
//  
//

import Foundation
import Combine

final class SearchViewModel: SearchViewModelProtocol {
    @Published var query: String = ""
    @Published var results: [SearchResult] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var shouldNavigate = false
    
    private var cancellables = Set<AnyCancellable>()

    func tapSearch() {
        guard !query.isEmpty else { return }
        isLoading = true
        
        Task {@MainActor in
            do {
                results = try await MercadoLibreAPI.shared.search(query: query)
                errorMessage = nil
                isLoading = false
                
                if !results.isEmpty {
                    shouldNavigate = true
                }
                
            } catch {
                results = []
                errorMessage = (error as? APIError)?.errorDescription ?? "Ocurrió un error desconocido."
                isLoading = false 
            }
        }
    }
}
