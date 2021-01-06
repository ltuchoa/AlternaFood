//
//  StepTwoViewController.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 16/12/20.
//

import UIKit

class StepTwoViewController: UIViewController, UITextFieldDelegate {

    let stepTwo = AddStepTwoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        constraintStepTwo()
        stepTwo.ingredientesField.delegate = self
    }

    func setupNavBar() {
        self.title = "Nova Receita"
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Próximo", style: .plain, target: self, action: #selector(nextStep))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(backView))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        stepTwo.ingredientes = stepTwo.ingredientesField.text
        stepTwo.ingredientesField.resignFirstResponder()
        stepTwo.arrayIngredientes.append(stepTwo.ingredientesField.text ?? "Sem ingredientes")
        stepTwo.updateTags()
        print(stepTwo.ingredientes)
        print(stepTwo.arrayIngredientes)
        return false
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
