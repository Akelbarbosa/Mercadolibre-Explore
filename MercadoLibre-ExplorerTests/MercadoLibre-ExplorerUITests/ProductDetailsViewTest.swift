//
//  ProductDetailsViewTests.swift
//  MercadoLibre-ExplorerTests
//
//  Created by Akel Barbosa on 23/02/25.
//

import XCTest
import SnapshotTesting
@testable import MercadoLibre_Explorer
import SwiftUI

final class ProductDetailsViewTests: XCTestCase {
    func testProductDetailsView() {
        let attributes: [ProductAttributeEntity] = [
            ProductAttributeEntity(id: "1", name: "Color", valueName: "Negro"),
            ProductAttributeEntity(id: "2", name: "Capacidad", valueName: "256GB"),
            ProductAttributeEntity(id: "3", name: "Pantalla", valueName: "6.1 pulgadas")
        ]
        
        let sut = ProductDetailsView(product: SearchResultEntity(
            id: "1",
            title: "iPhone 15",
            price: 3999.99,
            thumbnail: "http://http2.mlstatic.com/D_702740-CBT81492251579_122024-I.jpg",
            attributes: attributes
        ))
            .frame(width: 375, height: 800)
    
        
        assertSnapshot(of: sut, as: .image)
    }
}
