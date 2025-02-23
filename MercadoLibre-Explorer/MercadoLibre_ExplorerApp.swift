//
//  MercadoLibre_ExplorerApp.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 21/02/25.
//

import SwiftUI

@main
struct MercadoLibre_ExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = SearchViewModel()
            SearchView(viewModel: viewModel)
                .tint(.primary)
        }
    }
}
