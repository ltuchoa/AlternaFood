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
    let stepTwo = AddStepTwoView()
    let stepThree = AddStepThreeView()
    let stepFour = AddStepFourView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        constraintFakeNav()
        contrainStepOne()
//        contrainStepTwo()
//        contrainStepThree()
//        contrainStepFour()
        
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
    
    func contrainStepTwo() {
        view.addSubview(stepTwo)
        stepTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepTwo.topAnchor.constraint(equalTo: fakeNav.bottomAnchor, constant: 0),
            stepTwo.leftAnchor.constraint(equalTo: view.leftAnchor),
            stepTwo.rightAnchor.constraint(equalTo: view.rightAnchor),
            stepTwo.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func contrainStepThree() {
        view.addSubview(stepThree)
        stepThree.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepThree.topAnchor.constraint(equalTo: fakeNav.bottomAnchor, constant: 0),
            stepThree.leftAnchor.constraint(equalTo: view.leftAnchor),
            stepThree.rightAnchor.constraint(equalTo: view.rightAnchor),
            stepThree.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func contrainStepFour() {
        view.addSubview(stepFour)
        stepFour.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepFour.topAnchor.constraint(equalTo: fakeNav.bottomAnchor, constant: 0),
            stepFour.leftAnchor.constraint(equalTo: view.leftAnchor),
            stepFour.rightAnchor.constraint(equalTo: view.rightAnchor),
            stepFour.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
