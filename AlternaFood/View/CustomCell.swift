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

//    override var isHighlighted: Bool {
//        didSet {
//            if isHighlighted {
//                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
//                    self.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
//                }, completion: nil)
//            } else {
//                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
//                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
//                }, completion: nil)
//            }
//        }
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
