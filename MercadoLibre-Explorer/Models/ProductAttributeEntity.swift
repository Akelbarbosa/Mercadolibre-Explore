//
//  ProductAttributeEntity.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import Foundation

struct ProductAttributeEntity: Decodable {
    let id: String
    let name: String
    let valueName: String?

    enum CodingKeys: String, CodingKey {
        case id, name, valueName = "value_name"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        valueName = try container.decodeIfPresent(String.self, forKey: .valueName)
    }
    
    init(id: String, name: String, valueName: String?) {
        self.id = id
        self.name = name
        self.valueName = valueName
    }
}
