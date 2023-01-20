//
//  FirstInteractor.swift
//  CleanSwift
//
//  Created by Gregory Pinetree on 20.01.2023.
//

import CoreGraphics

final class FirstInteractor: FirstBusinessLogic {
    // MARK: - Fields
    private let presenter: FirstPresentationLogic

    // MARK: - Lifecycle
    init(presenter: FirstPresentationLogic) {
        self.presenter = presenter
    }

    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }

    func loadAction(_ request: Model.Action.Request) {
        let randRed = CGFloat.random(in: 0...1)
        let randGreen = CGFloat.random(in: 0...1)
        let randBlue = CGFloat.random(in: 0...1)

        presenter.presentAction(
            Model.Action.Response(
                red: randRed,
                green: randGreen,
                blue: randBlue
            )
        )
    }
}
