//
//  CustomCell.swift
//  AlternaFood
//
//  Created by Nathalia Cardoso on 20/11/20.
//

import Foundation

import UIKit

class CustomCell: UICollectionViewCell {
    var card: CardCollectionViewCell = CardCollectionViewCell()
//    var photo: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 12
//        return imageView
//    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        //contentView.backgroundColor = UIColor.init(named: "cardColor")
        contentView.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        card.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        card.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

//        card.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            card.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            card.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            card.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.27),
//            card.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.37)
//        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
