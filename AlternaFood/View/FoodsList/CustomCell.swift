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

    override init(frame: CGRect) {
        super.init(frame: .zero)

        contentView.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        card.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        card.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
