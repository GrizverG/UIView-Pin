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
        completion: @escaping (QuotesResponse) -> Void
    ) {
        let request = Request(endpoint: QuotesEndpoint.quotes)
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
                        let decodedData = try? JSONDecoder().decode(QuotesResponse.self, from: data)
                    else {
                        return
                    }
                    completion(decodedData)
                default: break
                }
            default: break
            }
        }
    }
    
}
