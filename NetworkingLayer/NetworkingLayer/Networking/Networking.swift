//
//  Networking.swift
//  NetworkingLayer
//
//  Created by Мельник Всеволод on 03.02.2023.
//

import Foundation

final class Networking: NetworkingLogic {
    public var baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func execute(_ request: Request, completion: @escaping (NetworkResult) -> Void) {
        guard let request = convert(request) else {
            return
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            completion(.success(NetworkModel.Result(data: data, response: response)))
        }
        task.resume()
    }
    
    private func convert(_ request: Request) -> URLRequest? {
        guard let url = generateDestinationURL(request) else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.endpoint.headers
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        
        return urlRequest
    }
    
    private func generateDestinationURL(_ request: Request) -> URL? {
        guard
            let url = URL(string: baseURL),
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else {
            return nil
        }
        let queryItems = request.parameters?.map {
            URLQueryItem(name: $0, value: $1)
        }
        components.path = request.endpoint.compositPath
        components.queryItems = queryItems
        
        return components.url
    }
}
