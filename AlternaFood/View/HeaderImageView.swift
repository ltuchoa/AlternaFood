//
//  HeaderImageView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 24/11/20.
//

import UIKit

class HeaderImageView: UIView {

    let maskImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "maskFoto"))
        return image
    }()

    let imageHeader: UIImageView = {
        let image = UIImageView(image: UIImage(named: "jacaFoto"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configImageHeader()
        configMaskFoto()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configImageHeader() {
        self.addSubview(imageHeader)
        imageHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageHeader.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageHeader.topAnchor.constraint(equalTo: self.topAnchor),
            imageHeader.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0),
            imageHeader.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0)
        ])
    }
    
    func configMaskFoto() {
        self.addSubview(maskImage)
        maskImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maskImage.topAnchor.constraint(equalTo: self.topAnchor),
            maskImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            maskImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0),
            maskImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0)
        ])
    }
}
