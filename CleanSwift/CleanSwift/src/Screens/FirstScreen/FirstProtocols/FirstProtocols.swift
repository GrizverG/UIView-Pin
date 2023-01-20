//
//  FirstProtocols.swift
//  CleanSwift
//
//  Created by Gregory Pinetree on 20.01.2023.
//

protocol FirstBusinessLogic {
    typealias Model = FirstModel
    func loadStart(_ request: Model.Start.Request)
    func loadAction(_ request: Model.Action.Request)
}

protocol FirstPresentationLogic {
    typealias Model = FirstModel
    func presentStart(_ response: Model.Start.Response)
    func presentAction(_ response: Model.Action.Response)
}

protocol FirstDisplayLogic: AnyObject {
    typealias Model = FirstModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayAction(_ viewModel: Model.Action.ViewModel)
}

protocol FirstRoutingLogic {
    func routeTo()
}
