//
//  StepFourViewController.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 16/12/20.
//

import UIKit

class StepFourViewController: UIViewController {

    let stepFour = AddStepFourView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        constraintStepFour()
    }

    func setupNavBar() {
        self.title = "Nova Receita"
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: #selector(nextStep))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(backView))
    }

    @objc func nextStep() {

    }

    @objc func backView() {
        self.navigationController?.popViewController(animated: false)
    }

    func constraintStepFour() {
        view.addSubview(stepFour)
        stepFour.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepFour.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stepFour.leftAnchor.constraint(equalTo: view.leftAnchor),
            stepFour.rightAnchor.constraint(equalTo: view.rightAnchor),
            stepFour.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
