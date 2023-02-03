//
//  Endpoint.swift
//  NetworkingLayer
//
//  Created by Мельник Всеволод on 03.02.2023.
//

import Foundation

protocol Endpoint {
    var compositPath: String { get }
    var headers: HeaderModel { get }
}
