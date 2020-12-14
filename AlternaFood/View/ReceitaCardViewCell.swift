//
//  ReceitaCardTableViewCell.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 23/11/20.
//

import UIKit
import Cosmos

class ReceitaCardViewCell: UIView {
    
    let name: UILabel = {
        let name = UILabel()
        name.tintColor = UIColor.black
        name.text = "Teste"
        name.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return name
    }()
    
    let image: UIImageView = {
        let img = UIImageView(image: UIImage(named: "emptyStateCardFoto") ?? UIImage(named: "emptyStateCardFoto")) 
        img.clipsToBounds = true
        img.layer.cornerRadius = 12
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let background: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor.clear
        background.layer.cornerRadius = 12
        background.layer.shadowColor = UIColor.black.cgColor
        background.layer.shadowOpacity = 0.25
        background.layer.shadowOffset = .zero
        return background
    }()
    
    let modal: UIView = {
        let modal = UIView()
        modal.backgroundColor = UIColor.init(named: "cardReceitaColor")
        modal.layer.cornerRadius = 12
        return modal
    }()
    
    let tagTempo: TagView = {
        let tag = TagView()
        tag.name.text = "30 min"
        return tag
    }()
    
    let tagPessoas: TagView = {
        let tag = TagView()
        tag.name.text = "3 pessoas"
        return tag
    }()
    
//    let rating: CosmosView = {
//        let rating = CosmosView()
//        rating.rating = 1
//
//        rating.settings.totalStars = 1
//        rating.settings.updateOnTouch = false
//        rating.settings.fillMode = .full
//        rating.settings.filledColor = UIColor.init(named: "actionColor")!
//        rating.settings.starSize = 17
//        rating.settings.starMargin = 5
//        rating.settings.filledBorderColor = UIColor.init(named: "actionColor")!
//        rating.settings.filledImage = UIImage(named: "starFilledIcon")
//        rating.settings.emptyImage = UIImage(named: "starEmptyIcon")
//
//        rating.text = "4.5 (58)"
//        rating.settings.textMargin = 5
//        rating.settings.textColor = UIColor.black
//        rating.settings.textFont = UIFont.systemFont(ofSize: 15, weight: .medium)
//
//        return rating
//    }()
    
    var receita: Receita? {
        didSet {
//            print("A receita -"+receita!.nomeReceita!)
            name.text = receita!.nomeReceita ?? "Receita"
            tagPessoas.name.text = receita!.porcaoReceita ?? "- Porções"
            tagTempo.name.text = receita!.tempoPreparoReceita ?? "- Mim"
            if receita?.imageReceita! == "" {
                image.image = UIImage(named: "emptyStateCardFoto")
            } else {
                image.image = UIImage(named: receita?.imageReceita ?? "emptyStateCardFoto")
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(background)
        setupBackgroundConstraints()
        setupImageConstraints()
        setupModalConstraints()
        setupNameConstraints()
        //setupRatingConstraints()
        setupTagTempoConstraints()
        setupTagPessoasConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackgroundConstraints() {
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setupImageConstraints() {
        background.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: background.topAnchor),
            image.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: background.trailingAnchor),
            image.heightAnchor.constraint(equalTo: background.heightAnchor, multiplier: 0.61)
        ])
    }
    
    func setupModalConstraints() {
        background.addSubview(modal)
        modal.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            modal.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            modal.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            modal.trailingAnchor.constraint(equalTo: background.trailingAnchor),
            modal.heightAnchor.constraint(equalToConstant: 86)
        ])
    }
    
    func setupNameConstraints() {
        modal.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: modal.topAnchor, constant: 15),
            name.leadingAnchor.constraint(equalTo: modal.leadingAnchor, constant: 15),
            name.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
//    func setupRatingConstraints() {
//        modal.addSubview(rating)
//        rating.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            rating.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
//            rating.leadingAnchor.constraint(equalTo: modal.leadingAnchor, constant: 15)
//        ])
//    }
    
    func setupTagTempoConstraints() {
        modal.addSubview(tagTempo)
        tagTempo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagTempo.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            tagTempo.leadingAnchor.constraint(equalTo: modal.leadingAnchor, constant: 15),
            tagTempo.heightAnchor.constraint(equalToConstant: 24),
            tagTempo.widthAnchor.constraint(equalToConstant: 112)
        ])
    }
    
    func setupTagPessoasConstraints() {
        modal.addSubview(tagPessoas)
        tagPessoas.name.text = receita?.porcaoReceita! ?? "Porções"
        tagPessoas.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagPessoas.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            tagPessoas.leadingAnchor.constraint(equalTo: tagTempo.trailingAnchor, constant: 8),
            tagPessoas.heightAnchor.constraint(equalToConstant: 24),
            tagPessoas.widthAnchor.constraint(equalToConstant: 112)
        ])
    }
}
