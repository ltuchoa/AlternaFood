//
//  FakeNavigationView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 15/12/20.
//

import UIKit

class FakeNavigationView: UIView {

    let viewSteOne = AddStepOneView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constrainTitle()
        constraintCancel()
        constraintProximo()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cancel: UIButton = {
        let button = UIButton(type: .custom)
//        button.frame = CGRect(x: 0.0, y: 0.0, width: 50, height: 50)
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(UIColor.init(named: "actionColor"), for: .normal)
        return button
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "Nova Receita"
        return title
    }()
    
    let proximo: UIButton = {
        let button = UIButton(type: .custom)
//        button.frame = CGRect(x: 0.0, y: 0.0, width: 50, height: 50)
        button.setTitle("Próximo", for: .normal)
        button.setTitleColor(UIColor.init(named: "actionColor"), for: .normal)
        return button
    }()
    
    func constraintCancel() {
        addSubview(cancel)
        cancel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cancel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])
    }
    
    func constraintProximo() {
        addSubview(proximo)
        proximo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            proximo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            proximo.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])
    }
    
    func constrainTitle() {
      addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }

}
