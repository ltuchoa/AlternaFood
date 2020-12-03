//
//  DescricaoReceitaView.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 30/11/20.
//

import UIKit

class DescricaoReceitaView: UIView {
    
    //
    let ingredientes = ["200g e farinha de trigo", "Amendoas a gosto", "Açúcar a gosto", "500 ml de Leite e Amêndoas" , "Amendoas a gosto", "Açúcar a gosto", "Amendoas a gosto", "Açúcar a gosto", "Amendoas a gosto", "Açúcar a gosto"]
    let preparo = ["Misture tudo no liquidificador", "Unte a forma com farinha", "Coloque na forma e Vrau", "Unte a forma com farinha", "Unte a forma com farinha", "Unte a forma com farinha"]
    //
    
    let tableView = UITableView()
    
    let savedButton = UIButton()
    let viewButton = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    var saved: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configTableView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 20
    }
    
    func configTableView() {
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}

extension DescricaoReceitaView: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return ingredientes.count
        case 3:
            return 1
        case 4:
            return preparo.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = HeaderDescricaoReceitaTableViewCell()
            configSavedButton()
            cell.accessoryView = viewButton
            
            return cell
        case 1:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
            cell.textLabel?.text = "Ingredientes"
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            cell.textLabel?.text = "- \(ingredientes[indexPath.row])"
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
            cell.textLabel?.text = "Modo de Preparo"
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            cell.textLabel?.text = "- \(preparo[indexPath.row])"
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func configSavedButton() {
        viewButton.addSubview(savedButton)
        savedButton.tintColor = UIColor.init(named: "actionColor")
        savedButton.frame = CGRect(x: 0, y: 0, width: 60, height: 80)
        savedButton.setImage(UIImage.init(named: "bookmark"), for: .normal)
        savedButton.imageView?.contentMode = .scaleAspectFit
        savedButton.imageEdgeInsets = UIEdgeInsets.init(top: 35, left: 25, bottom: 30, right: 25)
        savedButton.sizeToFit()
        savedButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        savedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            savedButton.topAnchor.constraint(equalTo: viewButton.topAnchor, constant: 10),
            savedButton.trailingAnchor.constraint(equalTo: viewButton.trailingAnchor, constant: -10)
        ])
    }

    @objc func saveTapped() {
        print("Foi tapeado")
        
        if saved == false {
            savedButton.setImage(UIImage.init(named: "bookmark.fill"), for: .normal)
            saved = true
        } else {
            savedButton.setImage(UIImage.init(named: "bookmark"), for: .normal)
            saved = false
        }
    }

}
