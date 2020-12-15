//
//  AdicionarReceitaViewController.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 15/12/20.
//

import UIKit

class AdicionarReceitaViewController: UIViewController{

    let fakeNav = FakeNavigationView()
    let stepOne = AddStepOneView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        constraintFakeNav()
        contrainStepOne()
    }
    
    func constraintFakeNav() {
        view.addSubview(fakeNav)
        fakeNav.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fakeNav.topAnchor.constraint(equalTo: view.topAnchor),
            fakeNav.leftAnchor.constraint(equalTo: view.leftAnchor),
            fakeNav.rightAnchor.constraint(equalTo: view.rightAnchor),
            fakeNav.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func contrainStepOne() {
        view.addSubview(stepOne)
        stepOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepOne.topAnchor.constraint(equalTo: fakeNav.bottomAnchor, constant: 0),
            stepOne.leftAnchor.constraint(equalTo: view.leftAnchor),
            stepOne.rightAnchor.constraint(equalTo: view.rightAnchor),
            stepOne.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
 
    

}
