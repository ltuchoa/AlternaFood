//
//  AddStepOneView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 15/12/20.
//

import UIKit

class AddStepOneView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintTitleLabel()
        contraintTitleField()
        constraintTempoLabel()
        constraintTempoField()
        constraintPorcaoLabel()
        constraintPorcaoField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Qual o nome da receita?"
        title.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return title
    }()
    
    let tempoLabel: UILabel = {
        let tempo = UILabel()
        tempo.text = "Qual o tempo de preparo?"
        tempo.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return tempo
    }()
    
    let porcaoLabel: UILabel = {
        let porcao = UILabel()
        porcao.text = "Quantas porções a receita rende?"
        porcao.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return porcao
    }()
    
    let titleField: UITextField = {
        let title = UITextField()
        title.attributedPlaceholder = NSAttributedString(string: "Nome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(named: "placeHolderColor")])
        title.tintColor = UIColor.init(named: "actionColor")
        title.textColor = UIColor.init(named: "actionColor")
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return title
    }()
    
    let tempoField: UITextField = {
        let tempo = UITextField()
        tempo.attributedPlaceholder = NSAttributedString(string: "Tempo", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(named: "placeHolderColor")])
        tempo.tintColor = UIColor.init(named: "actionColor")
        tempo.textColor = UIColor.init(named: "actionColor")
        tempo.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return tempo
    }()
    
    let porcaoField: UITextField = {
        let porcao = UITextField()
        porcao.attributedPlaceholder = NSAttributedString(string: "Porção", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(named: "placeHolderColor")])
        porcao.tintColor = UIColor.init(named: "actionColor")
        porcao.textColor = UIColor.init(named: "actionColor")
        porcao.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return porcao
    }()
    
    
    func constraintTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func contraintTitleField() {
        addSubview(titleField)
        titleField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            titleField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func constraintTempoLabel() {
        addSubview(tempoLabel)
        tempoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tempoLabel.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 20),
            tempoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func constraintTempoField() {
        addSubview(tempoField)
        tempoField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tempoField.topAnchor.constraint(equalTo: tempoLabel.bottomAnchor, constant: 15),
            tempoField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func constraintPorcaoLabel() {
        addSubview(porcaoLabel)
        porcaoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            porcaoLabel.topAnchor.constraint(equalTo: tempoField.bottomAnchor, constant: 20),
            porcaoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func constraintPorcaoField() {
        addSubview(porcaoField)
        porcaoField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            porcaoField.topAnchor.constraint(equalTo: porcaoLabel.bottomAnchor, constant: 15),
            porcaoField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
}
