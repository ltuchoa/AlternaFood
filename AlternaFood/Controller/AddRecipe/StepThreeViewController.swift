//
//  StepThreeViewController.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 16/12/20.
//

import UIKit

class StepThreeViewController: UIViewController {

    let stepThree = AddStepThreeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        constraintStepThree()
    }

    func setupNavBar() {
        self.title = "Nova Receita"
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Próximo", style: .plain, target: self, action: #selector(nextStep))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(backView))
    }

    @objc func nextStep() {
        let stepFour = StepFourViewController()
        self.navigationController?.pushViewController(stepFour, animated: false)
    }

    @objc func backView() {
        self.navigationController?.popViewController(animated: false)
    }

    func constraintStepThree() {
        view.addSubview(stepThree)
        stepThree.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepThree.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stepThree.leftAnchor.constraint(equalTo: view.leftAnchor),
            stepThree.rightAnchor.constraint(equalTo: view.rightAnchor),
            stepThree.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
