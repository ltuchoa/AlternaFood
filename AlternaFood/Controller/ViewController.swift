//
//  ViewController.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 18/11/20.
//

import UIKit
import Cosmos

class ViewController: UIViewController {

    let card = CardCollectionViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        view.backgroundColor = .white
        view.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.27),
            card.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.37)
        ])

        guard let _ = UIApplication.shared.delegate as? AppDelegate else { return }
    }

}
