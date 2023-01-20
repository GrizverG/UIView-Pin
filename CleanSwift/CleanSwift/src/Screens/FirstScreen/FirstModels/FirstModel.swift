//
//  FirstModel.swift
//  CleanSwift
//
//  Created by Gregory Pinetree on 20.01.2023.
//

import UIKit

enum FirstModel {
    enum Start {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }

    enum Action {
        struct Request { }
        struct Response {
            var red: CGFloat
            var green: CGFloat
            var blue: CGFloat
        }

        struct ViewModel {
            var color: UIColor
        }
    }
}
