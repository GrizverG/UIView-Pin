//
//  QuotesWorker.swift
//  NetworkingLayer
//
//  Created by Al Stark on 17.02.2023.
//

import Foundation

final class QuotesWorker {
    private let networking = Networking(baseURL: "https://dummyjson.com")

    // MARK: - Quotes
    func fetchQuotes(
        completion: @escaping (Result<QuotesResponse, Error>) -> Void
    ) {
        let endpoint = QuotesEndpoint.quotes
        fetch(endpoint: endpoint, completion: completion)
    }

    // MARK: - Carts
    func fetchCarts(
        completion: @escaping (Result<CartsResponse, Error>) -> Void
    ) {
        let endpoint = QuotesEndpoint.carts
        fetch(endpoint: endpoint, completion: completion)
    }

    func fetch<T: Decodable>(
        endpoint: Endpoint,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let request = Request(endpoint: endpoint)
        networking.execute(request) { result in
            switch result {
            case .success(let result):
                guard let response = result.response as? HTTPURLResponse else {
                    return
                }
                switch response.statusCode {
                case 200...299:
                    guard
                        let data = result.data,
                        let decodedData = try? JSONDecoder().decode(T.self, from: data)
                    else {
                        return
                    }
                    completion(.success(decodedData))
                default: break
                }
            default: break
            }
        }
    }
    
}
