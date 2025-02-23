//
//  MercadoLibreAPITests.swift
//  MercadoLibre-ExplorerTests
//
//  Created by Akel Barbosa on 22/02/25.
//

import XCTest
@testable import MercadoLibre_Explorer

class MercadoLibreAPITests: XCTestCase {
    var api: MercadoLibreAPI!

    override func setUp() {
        super.setUp()

        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)

        api = MercadoLibreAPI(session: session)
    }
    
    override func tearDown() {
        api = nil
        MockURLProtocol.requestHandler = nil
        super.tearDown()
    }
    
    func testSearch_SuccessfulResponse() async throws {
        // Simulamos una respuesta válida de la API con datos genéricos
        let jsonResponse = """
        {
            "results": [
                {
                    "id": "MLA123456",
                    "title": "Producto de prueba",
                    "price": 1000.50,
                    "thumbnail": "http://example.com/image.jpg",
                    "attributes": [
                        {
                            "id": "COLOR",
                            "name": "Color",
                            "value_name": "Negro"
                        },
                        {
                            "id": "STORAGE",
                            "name": "Capacidad",
                            "value_name": "256GB"
                        },
                        {
                            "id": "SCREEN",
                            "name": "Pantalla",
                            "value_name": "6.1 pulgadas"
                        }
                    ]
                }
            ]
        }
        """.data(using: .utf8)!

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (response, jsonResponse)
        }

        let results = try await api.search(query: "Test")

        XCTAssertFalse(results.isEmpty, "La respuesta no debería estar vacía")
        
        let firstResult = results.first!
        
        XCTAssertFalse(firstResult.id.isEmpty, "El ID no debería estar vacío")
        XCTAssertFalse(firstResult.title.isEmpty, "El título no debería estar vacío")
        XCTAssertGreaterThan(firstResult.price, 0, "El precio debería ser mayor que 0")
        XCTAssertTrue(firstResult.thumbnail.hasPrefix("http"), "La imagen debería ser una URL válida")
    }
    
    func testSearch_InvalidResponse() async {
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 500,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (response, Data())
        }
        
        do {
            _ = try await api.search(query: "Motorola G6")
            XCTFail("Expected failure but got success")
        } catch let error as APIError {
            XCTAssertEqual(error, .invalidResponse)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testSearch_DecodingError() async {
        let invalidJson = "{ invalid json }".data(using: .utf8)!
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            return (response, invalidJson)
        }
        
        do {
            _ = try await api.search(query: "Motorola G6")
            XCTFail("Expected failure but got success")
        } catch let error as APIError {
            XCTAssertEqual(error, .decodingFailed)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
