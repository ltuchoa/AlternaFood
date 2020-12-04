//
//  ReceitaCardTableViewCell.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 24/11/20.
//

import UIKit

class ReceitaCardTableViewCell: UITableViewCell {
    
    var card = ReceitaCardViewCell()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewConstraint()
    }
    
    func setupViewConstraint() {
        addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            card.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            card.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            card.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.heightAnchor.constraint(equalToConstant: 185)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: animationOptions, animations: {
                        self.transform = .init(scaleX: 0.9, y: 0.9)
                       }, completion: { _ in
                        UIView.animate(withDuration: 0.2,
                                       delay: 0,
                                       usingSpringWithDamping: 1,
                                       initialSpringVelocity: 0,
                                       options: animationOptions, animations: {
                                        self.transform = .identity
                                       }, completion: nil)
                       })
    }

}
