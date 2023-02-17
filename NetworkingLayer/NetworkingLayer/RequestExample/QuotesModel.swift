//
//  QuotesModel.swift
//  NetworkingLayer
//
//  Created by Al Stark on 17.02.2023.
//

import Foundation

// MARK: - QuoteResponse
struct QuotesResponse: Codable {
    let quotes: [Quote]
    let total, skip, limit: Int
}

// MARK: - Quote
struct Quote: Codable {
    let id: Int
    let quote, author: String
}

// MARK: - CartsResponse
struct CartsResponse: Codable {
    let carts: [Cart]
    let total, skip, limit: Int
}

// MARK: - Cart
struct Cart: Codable {
    let id: Int
    let total, discountedTotal, userId, totalProducts: Int
    let totalQuantity: Int
}
