//
//  FirstPresenter.swift
//  CleanSwift
//
//  Created by Gregory Pinetree on 20.01.2023.
//

import UIKit

final class FirstPresenter: FirstPresentationLogic {
    // MARK: - Constants
    private enum Constants {

    }

    weak var view: FirstDisplayLogic?

    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel())
    }

    func presentAction(_ response: Model.Action.Response) {
        let randColor = UIColor(
            displayP3Red: response.red,
            green: response.green,
            blue: response.blue,
            alpha: 1
        )

        view?.displayAction(Model.Action.ViewModel(color: randColor))
    }
}
