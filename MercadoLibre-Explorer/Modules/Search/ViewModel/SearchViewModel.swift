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
}
