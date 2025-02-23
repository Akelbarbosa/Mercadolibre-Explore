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
    @Published var results: [SearchResultEntity] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var shouldNavigate = false
    
    private var cancellables = Set<AnyCancellable>()

    func tapSearch() {
        guard !query.isEmpty else { return }
        isLoading = true
        
        Task {
            await MainActor.run {
                isLoading = true
            }

            do {
                let fetchedResults = try await MercadoLibreAPI.shared.search(query: query)

                await MainActor.run {
                    results = fetchedResults
                    errorMessage = nil
                    isLoading = false
                    shouldNavigate = !results.isEmpty
                }
            } catch {
                await MainActor.run {
                    results = []
                    errorMessage = (error as? APIError)?.errorDescription ?? "Ocurrió un error desconocido."
                    isLoading = false
                }
            }
        }    }
}
