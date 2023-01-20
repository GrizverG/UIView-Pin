//
//  FirstViewController.swift
//  CleanSwift
//
//  Created by Gregory Pinetree on 20.01.2023.
//

import UIKit

final class FirstViewController: UIViewController,
                            FirstDisplayLogic {
    // MARK: - Constants
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
    }

    // MARK: - Fields
    private let router: FirstRoutingLogic
    private let interactor: FirstBusinessLogic
    private let button = UIButton(type: .system)

    // MARK: - LifeCycle
    init(
        router: FirstRoutingLogic,
        interactor: FirstBusinessLogic
    ) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        interactor.loadStart(Model.Start.Request())
    }

    // MARK: - Configuration
    private func configureUI() {
        view.backgroundColor = .systemPink

        button.frame = CGRect(x: 20, y: 20, width: 80, height: 30)
        button.backgroundColor = .white
        button.setTitle("Push me", for: .normal)
        button.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        view.addSubview(button)
    }

    // MARK: - Actions
    @objc
    private func buttonWasTapped() {
        interactor.loadAction(Model.Action.Request())
    }

    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {

    }

    func displayAction(_ viewModel: Model.Action.ViewModel) {
        view.backgroundColor = viewModel.color
    }
}
