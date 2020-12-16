//
//  AddStepTwoView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 15/12/20.
//

import UIKit

class AddStepTwoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constraintIngredientesLabel()
        contraintIngredientesField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let ingredientesLabel: UILabel = {
        let title = UILabel()
        title.text = "Adicione os ingredientes:"
        title.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return title
    }()
    
    let ingredientesField: UITextField = {
        let title = UITextField()
        title.attributedPlaceholder = NSAttributedString(string: "Ingrediente", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(named: "placeHolderColor")])
        title.tintColor = UIColor.init(named: "actionColor")
        title.textColor = UIColor.init(named: "actionColor")
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return title
    }()
    
    func constraintIngredientesLabel() {
        addSubview(ingredientesLabel)
        ingredientesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ingredientesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            ingredientesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func contraintIngredientesField() {
        addSubview(ingredientesField)
        ingredientesField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ingredientesField.topAnchor.constraint(equalTo: ingredientesLabel.bottomAnchor, constant: 15),
            ingredientesField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
}
