//
//  QuotesEndpoint.swift
//  NetworkingLayer
//
//  Created by Al Stark on 17.02.2023.
//

import Foundation

enum QuotesEndpoint: Endpoint {
    case quotes
    
    var compositPath: String {
        switch self {
        case .quotes: return "/quotes"
        }
    }
    
    var headers: HeaderModel { [:] }
}
