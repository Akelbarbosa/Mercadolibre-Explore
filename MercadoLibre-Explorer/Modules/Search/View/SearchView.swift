//
//  SearchView.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 21/02/25.
//  
//

import SwiftUI

struct SearchView<ViewModel>: View where ViewModel: SearchViewModelProtocol {
    @StateObject private var viewModel: ViewModel

    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: .marginMedium) {
                SearchBar(text: $viewModel.query, placeholder: "Buscar")
                
                PrimaryButton(title: "Buscar", isDisabled: viewModel.query.isEmpty, isLoading: viewModel.isLoading) {
                    viewModel.tapSearch()
                }
                
                .navigationDestination(isPresented: $viewModel.shouldNavigate) {
                    ProductListView(query: viewModel.query, results: viewModel.results)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationTitle("Buscar")
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
