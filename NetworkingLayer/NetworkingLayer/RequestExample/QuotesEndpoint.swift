//
//  QuotesEndpoint.swift
//  NetworkingLayer
//
//  Created by Al Stark on 17.02.2023.
//

import Foundation

enum QuotesEndpoint: Endpoint {
    case quotes
    case carts
    
    var compositPath: String {
        switch self {
        case .quotes:
            return "/quotes"
        case .carts:
            return "/carts"
        }
    }
    
    var headers: HeaderModel { [:] }
}
