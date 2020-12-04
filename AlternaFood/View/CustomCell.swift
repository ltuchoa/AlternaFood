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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isHighlighted: true)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isHighlighted: false)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isHighlighted: false)
    }

    private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)?=nil) {
        let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
        if isHighlighted {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0,
                           options: animationOptions, animations: {
                            self.transform = .init(scaleX: 0.9, y: 0.9)
                           }, completion: completion)
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0,
                           options: animationOptions, animations: {
                            self.transform = .identity
                           }, completion: completion)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
