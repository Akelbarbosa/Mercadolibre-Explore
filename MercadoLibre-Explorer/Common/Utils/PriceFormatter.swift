//
//  PriceFormatter.swift
//  MercadoLibre-Explorer
//
//  Created by Akel Barbosa on 22/02/25.
//

import Foundation

public struct PriceFormatter {
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.locale = Locale(identifier: "es_AR")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }()

    public static func format(_ price: Double) -> String {
        return formatter.string(from: NSNumber(value: price)) ?? "$\(price)"
    }
}
