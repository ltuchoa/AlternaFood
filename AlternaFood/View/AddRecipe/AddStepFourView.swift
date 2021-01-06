//
//  AddStepFourView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 15/12/20.
//

import UIKit

class AddStepFourView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constraintFotoLabel()
        constraintfotoImage()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let fotoLabel: UILabel = {
        let title = UILabel()
        title.text = "Adicione uma foto para a receita:"
        title.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return title
    }()
    
    let fotoImage: UIImageView = {
        let foto = UIImageView(image: UIImage(named: "emptyStateFoto"))
        foto.layer.cornerRadius = 12
        foto.clipsToBounds = true
        return foto
    }()
    
    func constraintFotoLabel() {
        addSubview(fotoLabel)
        fotoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fotoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            fotoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func constraintfotoImage() {
        addSubview(fotoImage)
        fotoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fotoImage.topAnchor.constraint(equalTo: fotoLabel.bottomAnchor, constant: 20),
            fotoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fotoImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.27),
            fotoImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85)
        ])
    }
}


