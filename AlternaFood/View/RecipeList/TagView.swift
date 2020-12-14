//
//  TagView.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 23/11/20.
//

import UIKit

class TagView: UIView {

    let name: UILabel = {
        let name = UILabel()
        name.textColor = UIColor.white
        name.text = "Teste"
        name.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return name
    }()
    
    let background: UIView = {
        let background = UIView()
        return background
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(background)
        background.backgroundColor = UIColor.init(named: "tagColor")
        background.layer.cornerRadius = 5
        setupConstraints()
        setupNameConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setupNameConstraints() {
        background.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: background.centerYAnchor)
        ])
    }
    
}
