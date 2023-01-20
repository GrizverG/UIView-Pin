//
//  FirstAssembly.swift
//  CleanSwift
//
//  Created by Gregory Pinetree on 20.01.2023.
//

import UIKit

enum FirstAssembly {
    static func build() -> UIViewController {
        let router: FirstRouter = FirstRouter()
        let presenter: FirstPresenter = FirstPresenter()
        let interactor: FirstInteractor = FirstInteractor(presenter: presenter)
        let viewController: FirstViewController = FirstViewController(
            router: router,
            interactor: interactor
        )

        router.view = viewController
        presenter.view = viewController

        return viewController
    }
}
