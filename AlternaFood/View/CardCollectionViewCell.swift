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
        image.contentMode = .scaleAspectFit
        return image
    }()

    let name: UILabel = {
        let food = UILabel()
        food.textColor = .black
        food.numberOfLines = 0
        food.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        food.text = "Larissa só reclama, chata pra caralho"
        food.textAlignment = .center
        food.minimumScaleFactor = 0.7
        food.adjustsFontSizeToFitWidth = true
        food.sizeToFit()
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
            icon.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            icon.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.41),
            icon.heightAnchor.constraint(equalTo: background.heightAnchor, multiplier: 0.28)
        ])

    }

    func configNameConstraint() {
        background.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 15),
            name.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            name.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            name.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10)
        ])
    }
}
