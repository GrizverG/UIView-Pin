//
//  NetworkingLogic.swift
//  NetworkingLayer
//
//  Created by Мельник Всеволод on 03.02.2023.
//

import Foundation

protocol NetworkingLogic {
    
    typealias NetworkResult = Result<NetworkModel.Result, Error>
    
    func execute(_ request: Request, completion: @escaping (NetworkResult) -> Void)
}
