//
//  HeaderDescricaoReceitaViewCellTableViewCell.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 30/11/20.
//

import UIKit
import Cosmos

class HeaderDescricaoReceitaTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let savedButton = UIButton()
    
    let tagTempo: TagView = {
        let tag = TagView()
        tag.name.text = "30 min"
        return tag
    }()
    
    let tagPorcao: TagView = {
        let tag = TagView()
        tag.name.text = "3 pessoas"
        return tag
    }()
    
    let rating: CosmosView = {
        let rating = CosmosView()
        rating.rating = 4
        
        rating.settings.totalStars = 5
        rating.settings.updateOnTouch = false
        rating.settings.fillMode = .full
        rating.settings.filledColor = UIColor.init(named: "actionColor")!
        rating.settings.starSize = 17
        rating.settings.starMargin = 5
        rating.settings.filledBorderColor = UIColor.init(named: "actionColor")!
        rating.settings.filledImage = UIImage(named: "starFilledIcon")
        rating.settings.emptyImage = UIImage(named: "starEmptyIcon")
        
        rating.text = "4.5 (58)"
        rating.settings.textMargin = 5
//        rating.settings.textColor = UIColor.black
        rating.settings.textFont = UIFont.systemFont(ofSize: 15, weight: .medium)

        return rating
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLabelText()
        configTitleLabel()
        configButton()
        setupRatingConstraints()
        setupTagTime()
        setupTagPorcao()
        configCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            self.bottomAnchor.constraint(equalTo: tagPorcao.bottomAnchor, constant: 10)
        ])
    }
    
    func configButton() {
        addSubview(savedButton)
        savedButton.tintColor = UIColor.init(named: "actionColor")
        savedButton.frame = CGRect(x: 0, y: 0, width: 60, height: 80)
        savedButton.setImage(UIImage.init(named: "bookmark"), for: .normal)
        savedButton.imageView?.contentMode = .scaleAspectFit
        savedButton.imageEdgeInsets = UIEdgeInsets.init(top: 30, left: 25, bottom: 25, right: 25)
        savedButton.sizeToFit()
        savedButton.addTarget(self, action: #selector(saveTapped), for: .allTouchEvents)
        savedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            savedButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            savedButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
    }
    
    func configTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
    func setupRatingConstraints() {
        addSubview(rating)
        rating.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rating.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            rating.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }

    func setupTagTime() {
        addSubview(tagTempo)
        tagTempo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagTempo.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 10),
            tagTempo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tagTempo.widthAnchor.constraint(greaterThanOrEqualToConstant: 82),
            tagTempo.heightAnchor.constraint(greaterThanOrEqualToConstant: 24)
        ])
    }
    
    func setupTagPorcao() {
        addSubview(tagPorcao)
        tagPorcao.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagPorcao.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 10),
            tagPorcao.leadingAnchor.constraint(equalTo: tagTempo.trailingAnchor, constant: 8),
            tagPorcao.widthAnchor.constraint(greaterThanOrEqualToConstant: 112),
            tagPorcao.heightAnchor.constraint(greaterThanOrEqualToConstant: 24)
        ])
    }
    
    func setLabelText() {
        titleLabel.text = "Bolo Vegano"
    }
    
    @objc func saveTapped() {
        print("Save tapped")
    }
    
}
