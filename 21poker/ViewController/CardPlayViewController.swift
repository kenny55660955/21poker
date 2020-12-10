//
//  CardPlayViewController.swift
//  21poker
//
//  Created by Kenny on 2020/12/10.
//  Copyright © 2020 CodewithKenny. All rights reserved.
//

import UIKit

class CardPlayViewController: UIViewController {
    
    // MARK: - Proprety
    let cardPlayView: CardPlayView = {
       let cardView = CardPlayView()
        return cardView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setupView()
    }
    
    // MARK: UI method
    private func addSubView() {
        view.addSubview(cardPlayView)
    }
    
    private func setupView() {
        cardPlayView.translatesAutoresizingMaskIntoConstraints = false
        cardPlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cardPlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cardPlayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cardPlayView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
