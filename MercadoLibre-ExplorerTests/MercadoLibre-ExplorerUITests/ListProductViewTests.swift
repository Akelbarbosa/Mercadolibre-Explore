//
//  ListProductViewTests.swift
//  MercadoLibre-ExplorerTests
//
//  Created by Akel Barbosa on 22/02/25.
//

import XCTest
import SnapshotTesting
@testable import MercadoLibre_Explorer
import SwiftUI

final class ListProductViewTests: XCTestCase {
    func testListProductView() {
        let sut = ListProductsView(query: "Resultado", results: [
            SearchResultEntity(id: "1", title: "iPhone 15", price: 3999.99, thumbnail: "http://http2.mlstatic.com/D_702740-CBT81492251579_122024-I.jpg", attributes: []),
            SearchResultEntity(id: "2", title: "MacBook Pro", price: 7999.99, thumbnail: "https://http2.mlstatic.com/D_NQ_NP_2X_913372-MLA50099941835_072023-F.jpg", attributes: []),
            SearchResultEntity(id: "3", title: "AirPods Pro", price: 249.99, thumbnail: "https://http2.mlstatic.com/D_NQ_NP_2X_913372-MLA20941835_072023-F.jpg", attributes: [])
        ])
        
        assertSnapshot(of: sut, as: .image)
    }
}
