//
//  SpecificWorkingLogic.swift
//  NetworkingLayer
//
//  Created by Мельник Всеволод on 03.02.2023.
//

import Foundation

struct SomeType: Codable { }

enum NewsEndpoint: Endpoint {
    case news(rubricId: Int, pageSize: Int, pageIndex: Int)

    // https://news.myseldon.com/api/Section?rubricId=4&pageSize=8&pageIndex=1
    var compositPath: String {
        switch self {
        case .news(let rubricId, let pageSize, let pageIndex):
            return "\(basePath)rubricId=\(rubricId)&pageSize=\(pageSize)&pageIndex=\(pageIndex)"
        }
    }
    
    var headers: HeaderModel {
        return [:]
    }
    
    private var basePath: String {
        return "/api/Section?"
    }
    
}

protocol SpecificWorkingLogic {
    typealias SomethingResponse = (Result<SomeType, Error>) -> Void
    func retrieveSomething(completion: @escaping SomethingResponse)
}

final class SpecificWorker: SpecificWorkingLogic {
    
    private let networking: NetworkingLogic = Networking(baseURL: "https://news.myseldon.com")
    
    func retrieveSomething(completion: @escaping SomethingResponse) {
        let endpoint = NewsEndpoint.news(rubricId: 4, pageSize: 8, pageIndex: 1)
        
    }
    
    
}
