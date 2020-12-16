//
//  StepTwoViewController.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 16/12/20.
//

import UIKit

class StepTwoViewController: UIViewController {

    let stepTwo = AddStepTwoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        constraintStepTwo()
    }

    func setupNavBar() {
        self.title = "Nova Receita"
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Próximo", style: .plain, target: self, action: #selector(nextStep))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(backView))
    }

    @objc func nextStep() {
        let stepThree = StepThreeViewController()
        self.navigationController?.pushViewController(stepThree, animated: false)
    }

    @objc func backView() {
        self.navigationController?.popViewController(animated: false)
    }

    func constraintStepTwo() {
        view.addSubview(stepTwo)
        stepTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepTwo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stepTwo.leftAnchor.constraint(equalTo: view.leftAnchor),
            stepTwo.rightAnchor.constraint(equalTo: view.rightAnchor),
            stepTwo.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
