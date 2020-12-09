//
//  ListaReceitasView.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 30/11/20.
//

import UIKit

class ListaReceitasView: UIView {

    var rootViewController: UINavigationController?
    
    lazy var segmented: UISegmentedControl = {
        let segmentItems = ["Todas", "Salvas"]
        let control = UISegmentedControl(items: segmentItems)
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .allEvents)
        control.selectedSegmentIndex = 0
        return control
    }()

    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = true
        return table
    }()
    
    var listaTableReceita: [Receita] = []

    var listaReceitas: [Receita] = [] {
        didSet {
            let receitaToOrder = listaReceitas.sorted(by: { $0.nomeReceita! < $1.nomeReceita! })
            listaReceitas = receitaToOrder
            listaTableReceita = listaReceitas
            tableView.reloadData()
            print(listaReceitas.count)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupSegmentedConstraints()
        setupTableViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        
        listaTableReceita = []
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            listaTableReceita = listaReceitas
            if listaTableReceita.isEmpty {
                tableView.restore()
            }
        case 1:
            for receita in listaReceitas where receita.isSaved == true {
                listaTableReceita.append(receita)
            }
            if listaTableReceita.isEmpty {
                tableView.setEmptyView(message: "Você ainda não possui nenhuma receita salva!")
            } else {
                tableView.restore()
            }
        default:
            break
        }
        tableView.reloadData()
    }

    func scopeSearch() {
        switch segmented.selectedSegmentIndex {
        case 0:
            scopeAll()
        case 1:
            scopeSaved()
        default:
            break
        }
        tableView.reloadData()
    }
    
    func scopeSaved() {
        listaTableReceita = []
        for receita in listaReceitas where receita.isSaved == true {
            listaTableReceita.append(receita)
        }
        if !listaTableReceita.isEmpty {
            tableView.restore()
        }
        tableView.reloadData()
    }
    
    func scopeAll() {
        listaTableReceita = []
        listaTableReceita = listaReceitas
        tableView.reloadData()
    }
    
    func setupSegmentedConstraints() {
        addSubview(segmented)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmented.topAnchor.constraint(equalTo: topAnchor),
            segmented.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmented.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.90)
        ])
    }

    func setupTableViewConstraints() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmented.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        //tableView.register(ReceitaCardTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}
