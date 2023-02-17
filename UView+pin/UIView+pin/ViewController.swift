//
//  ViewController.swift
//  UIView+pin
//
//  Created by Vsevolod Melnik on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        
        let firstView = UIView()
        firstView.backgroundColor = .red
        
        view.addSubview(firstView)
        
        firstView.pinLeft(to: view, 50)
        firstView.pinTop(to: view, 50)
        firstView.pinCenter(to: view)
        
    }
}

