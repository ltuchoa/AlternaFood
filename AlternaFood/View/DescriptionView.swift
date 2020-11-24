//
//  DescriptionView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 21/11/20.
//

import UIKit

class DescriptionView: UIView {

    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configTable()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
    }

    func configTable() {
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }

}

extension DescriptionView: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return nil
//        default:
//            let header = "Receitas"
//            return header
//        }
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 4
        }
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                var cell = DescriptionSubTableViewCell()
//                cell.configCell(type: item, row: indexPath.row)
                return cell
            case 1:
                let cell = UITableViewCell()
                cell.textLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
                cell.textLabel?.text = "Receitas"
                return cell
            case 2:
                let cell = UITableViewCell()
                cell.textLabel?.text = "Aqui terá um card"
                return cell
            default:
                return UITableViewCell()
        }
    }
}
