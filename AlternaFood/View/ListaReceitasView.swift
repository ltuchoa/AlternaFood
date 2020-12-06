//
//  ListaReceitasView.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 30/11/20.
//

import UIKit

class ListaReceitasView: UIView {

    var rootViewController: UINavigationController?
    
    let segmented: UISegmentedControl = {
        let segmentItems = ["Todas", "Salvas"]
        let control = UISegmentedControl(items: segmentItems)
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0
        return control
    }()

    let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = true
        return table
    }()
    
    var listaReceitas: [Receita] = [] {
        didSet {
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
        switch(segmentedControl.selectedSegmentIndex) {
        case 0:
            // First segment tapped
            break
        case 1:
            // Second segment tapped
            break
        default:
            break
        }
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
