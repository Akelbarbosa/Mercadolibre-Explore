//
//  SearchViewModelProtocol.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 21/02/25.
//  
//

import Combine

protocol SearchViewModelProtocol: AnyObject, ObservableObject {
    var query: String { get set }
    var isLoading: Bool { get set }
    
    func tapSearch()
}
