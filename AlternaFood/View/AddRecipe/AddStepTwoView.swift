//
//  AddStepTwoView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 15/12/20.
//

import UIKit
import TTGTagCollectionView

class AddStepTwoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constraintIngredientesLabel()
        constraintIngredientesField()
        constraintTags()
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

    lazy var tags: TTGTextTagCollectionView = {
        let tags = TTGTextTagCollectionView()
        tags.alignment = .left
        tags.delegate = self

        let config = TTGTextTagConfig()
        config.backgroundColor = UIColor.init(named: "tagColor")
        config.textColor = .white
        config.borderWidth = 0
        config.shadowOpacity = 0.1
        config.cornerRadius = 5
        config.selectedBackgroundColor = .systemRed

        tags.addTags(["Água", "Castanha"], with: config)

        return tags
    }()
    
    func constraintIngredientesLabel() {
        addSubview(ingredientesLabel)
        ingredientesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ingredientesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            ingredientesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func constraintIngredientesField() {
        addSubview(ingredientesField)
        ingredientesField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ingredientesField.topAnchor.constraint(equalTo: ingredientesLabel.bottomAnchor, constant: 15),
            ingredientesField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }

    func constraintTags() {
        addSubview(tags)
        tags.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tags.topAnchor.constraint(equalTo: ingredientesField.bottomAnchor, constant: 40),
            tags.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            tags.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20)
        ])
    }

    func addTags(ingredientes: [String]) {
        let config = TTGTextTagConfig()
        config.backgroundColor = UIColor.init(named: "tagColor")
        config.textColor = .white
        config.borderWidth = 0
        config.shadowOpacity = 0.1
        config.cornerRadius = 5
        config.selectedBackgroundColor = .systemRed

        self.tags.addTags(ingredientes, with: config)
    }
    
}

extension AddStepTwoView: TTGTextTagCollectionViewDelegate {

}
