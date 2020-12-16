//
//  AddStepThreeView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 15/12/20.
//

import UIKit

class AddStepThreeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constraintPreparoLabel()
        contraintPreparoField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let preparoLabel: UILabel = {
        let title = UILabel()
        title.text = "Adicione o modo de preparo:"
        title.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return title
    }()
    
    let preparoField: UITextField = {
        let title = UITextField()
        title.attributedPlaceholder = NSAttributedString(string: "Preparo", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(named: "placeHolderColor")])
        title.tintColor = UIColor.init(named: "actionColor")
        title.textColor = UIColor.init(named: "actionColor")
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return title
    }()
    
    func constraintPreparoLabel() {
        addSubview(preparoLabel)
        preparoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            preparoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            preparoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func contraintPreparoField() {
        addSubview(preparoField)
        preparoField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            preparoField.topAnchor.constraint(equalTo: preparoLabel.bottomAnchor, constant: 15),
            preparoField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
}
