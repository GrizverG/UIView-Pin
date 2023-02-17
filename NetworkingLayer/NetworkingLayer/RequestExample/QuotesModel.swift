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
