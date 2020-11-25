//
//  DescriptionSubTableViewCell.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 22/11/20.
//

import UIKit

class DescriptionSubTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let infoLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configTitleLabel()
        configInfoLabel()
        configCell()
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0)
        ])
    }

    func configInfoLabel(){
        addSubview(infoLabel)
        infoLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    func configCell(/*type: item, row: int*/) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            self.bottomAnchor.constraint(equalTo: infoLabel.bottomAnchor)
        ])
        titleLabel.text = "Jaca"
        infoLabel.text = "É um alimento relativamente rico em caloria e fibras, além de possuir em sua composição vitaminas A, B, C e E, assim como os minerais cálcio, magnésio, ferro, potássio e fósforo."
    }
    
}
