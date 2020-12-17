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
    var saved: Bool?
    
    let cdManager = CDManager()
    
    var receita: Receita? {
        didSet {
            titleLabel.text = receita?.nomeReceita!
            tagTempo.name.text = receita?.tempoPreparoReceita!
            tagPorcao.name.text = receita?.porcaoReceita!
        }
    }
    
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
        rating.rating = 4.0
        
        rating.settings.totalStars = 5
        rating.settings.updateOnTouch = true
        rating.settings.fillMode = .half
        rating.settings.filledColor = UIColor.init(named: "actionColor")!
        rating.settings.starSize = 25
        rating.settings.starMargin = 5
        rating.settings.filledBorderColor = UIColor.init(named: "actionColor")!
        rating.settings.filledImage = UIImage(named: "starFilledIcon")
        rating.settings.emptyImage = UIImage(named: "starEmptyIcon")
        guard let uuid = UUID(uuidString: "07BA6D10-9FE4-456A-937D-66C126F5F676") else { return rating}
        CKManager().getRateRecipe(recipeID: uuid) { (result) in
            switch result {
            case .success(let result):
                rating.text = "\(result)"
                let rate = "\(result)"
                
                rating.rating = Double(rate) ?? 0
                
            case .failure(let error):
                print(error)
            }
        }
        //rating.text = "4.6 (58)"
        rating.settings.textMargin = 8  
//        rating.settings.textColor = UIColor.black
        rating.settings.textFont = UIFont.systemFont(ofSize: 20, weight: .medium)

        return rating
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        configCell()
        DispatchQueue.main.async {
            self.updateSavedSate()
        }
        configButton()
        configTitleLabel()
        setupRatingConstraints()
        setupTagTime()
        setupTagPorcao()
//        backgroundColor = .red
//        self.isUserInteractionEnabled = false
//        self.contentView.bringSubviewToFront(rating)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSavedSate() {
        saved = receita?.isSaved
        updateCloudButton()
    }
    
    func configCell() {
        NSLayoutConstraint.activate([
//            self.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            self.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configButton() {
//        contentView.isUserInteractionEnabled = false
        contentView.addSubview(savedButton)
        savedButton.tintColor = UIColor.init(named: "actionColor")
        savedButton.frame = CGRect(x: 0, y: 0, width: 60, height: 80)
        savedButton.setImage(UIImage.init(named: "bookmark"), for: .normal)
        savedButton.imageView?.contentMode = .scaleAspectFit
        savedButton.imageEdgeInsets = UIEdgeInsets.init(top: 30, left: 25, bottom: 25, right: 25)
        savedButton.sizeToFit()
        savedButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        savedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            savedButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            savedButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20)
        ])
        
    }
    
    func configTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.savedButton.leadingAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        ])
    }
    
    func setupRatingConstraints() {
        contentView.addSubview(rating)
        rating.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rating.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            rating.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20)
        ])
    }

    func setupTagTime() {
        contentView.addSubview(tagTempo)
        tagTempo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagTempo.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 12),
            tagTempo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            tagTempo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            tagTempo.widthAnchor.constraint(greaterThanOrEqualToConstant: 112),
            tagTempo.heightAnchor.constraint(greaterThanOrEqualToConstant: 24)
        ])
    }
    
    func setupTagPorcao() {
        contentView.addSubview(tagPorcao)
        tagPorcao.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagPorcao.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 12),
            tagPorcao.leadingAnchor.constraint(equalTo: tagTempo.trailingAnchor, constant: 8),
            tagPorcao.widthAnchor.constraint(greaterThanOrEqualToConstant: 112),
            tagPorcao.heightAnchor.constraint(greaterThanOrEqualToConstant: 24)
        ])
    }
    
    func setLabelText(name: String?) {
        titleLabel.text = name ?? "Receita"
    }
    
    @objc func saveTapped() {
        
        if saved == false {
            saved = true
            print("SAVED")
        } else {
            saved = false
            print("UNSAVE")
        }
        
        receita?.isSaved = saved!
        _ = cdManager.saveContext()
        updateCloudButton()
    }
    
    func updateCloudButton() {
        
        if saved == true {
            savedButton.setImage(UIImage.init(named: "bookmark.fill"), for: .normal)
        } else {
            savedButton.setImage(UIImage.init(named: "bookmark"), for: .normal)
        }
    
    }
    
}
