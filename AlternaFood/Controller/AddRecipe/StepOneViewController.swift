//
//  AdicionarReceitaViewController.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 15/12/20.
//

import UIKit

class StepOneViewController: UIViewController {

    let stepOne = AddStepOneView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        constraintStepOne()
    }
    
    func setupNavBar() {
        self.title = "Nova Receita"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Próximo", style: .plain, target: self, action: #selector(nextStep))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(dismissView))
    }

    @objc func nextStep() {
        stepOne.saveTitleField()
        stepOne.saveTempoField()
        stepOne.savePorcaoField()
        let stepTwo = StepTwoViewController()
        self.navigationController?.pushViewController(stepTwo, animated: false)
    }

    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func constraintStepOne() {
        view.addSubview(stepOne)
        stepOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stepOne.leftAnchor.constraint(equalTo: view.leftAnchor),
            stepOne.rightAnchor.constraint(equalTo: view.rightAnchor),
            stepOne.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}
