//
//  DescricaoReceitaView.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 30/11/20.
//

import UIKit

class DescricaoReceitaView: UIView {
    
    var receita: Receita?
    
    let tableView = UITableView()
    
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
            return (receita?.ingredientesReceita!.count) ?? 0
        case 3:
            return 1
        case 4:
            return (receita?.preparoReceita!.count) ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = HeaderDescricaoReceitaTableViewCell()
            cell.receita = receita
//            cell.textLabel?.text = nome
//            configSavedButton()
//            cell.accessoryView = viewButton
            
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
            cell.textLabel?.numberOfLines = 0
            let ingrediente = receita?.ingredientesReceita![indexPath.row]
            cell.textLabel?.text = "- \(ingrediente!)"
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
            cell.textLabel?.numberOfLines = 0
            let umPreparo = receita?.preparoReceita![indexPath.row]
            cell.textLabel?.text = "- \(umPreparo!)"
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }

}
