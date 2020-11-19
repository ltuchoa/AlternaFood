//
//  CardCollectionViewCell.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 19/11/20.
//

import UIKit

class CardCollectionViewCell: UIView {

    let background: UIView = {
        let backimage = UIView()
        backimage.backgroundColor = UIColor.init(named: "cardColor")
        backimage.layer.cornerRadius = 12
        return backimage
    }()

    let icon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "receitas_icon"))
        return image
    }()

    let name: UILabel = {

        let food = UILabel()
        food.numberOfLines = 0
        food.text = "Larissa só reclama, chata pra caralho"
        
        return food
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(background)
        configBackGroundConstraint()
        configIconConstraint()
        configNameConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configBackGroundConstraint() {
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    
    }
    func configIconConstraint() {
        background.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: background.topAnchor, constant: 40),
            icon.centerXAnchor.constraint(equalTo: background.centerXAnchor)
        ])

    }

    func configNameConstraint() {
        background.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -20),
            name.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            name.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 20)
        ])
    }
}
