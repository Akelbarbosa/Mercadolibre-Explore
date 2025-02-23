//
//  SearchViewTests.swift
//  MercadoLibre-ExplorerTests
//
//  Created by Akel Barbosa on 23/02/25.
//

import XCTest
import SnapshotTesting
@testable import MercadoLibre_Explorer
import SwiftUI

final class SearchViewTests: XCTestCase {
    func testSearchViewTests() {
        let viewModel = SearchViewModel()
        let sut = SearchView(viewModel: viewModel)
        
        assertSnapshot(of: sut, as: .image)
    }
}
