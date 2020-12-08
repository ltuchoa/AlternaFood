//
//  DescriptionView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 21/11/20.
//
//swiftlint:disable force_cast

import UIKit

class DescriptionView: UIView {

    let tableView = UITableView()
    var rootViewController: UINavigationController?
    let cdManager = CDManager()
    
    var substituto: Substituto? {
        didSet {
            getListaReceitas()
        }
    }
    var idAlimento: UUID?
//    var receita: Receita?
    var listaReceitas: [Receita] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
        configTable()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configView() {
        self.backgroundColor = .systemBackground
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
        tableView.allowsSelection = true
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    
    func getListaReceitas() {

        guard let subst = substituto else { return }
        let receitas = subst.receitasSubstituto?.allObjects as! [Receita]
        for receita in receitas where receita.idAlimentoFrom == idAlimento {
            
            listaReceitas.append(receita)
        }
    }

}

extension DescriptionView: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return listaReceitas.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let subst = substituto else { return UITableViewCell()}
        
        switch indexPath.section {
        case 0:
            let cell = DescriptionSubTableViewCell()
            cell.setLabelDescripton(subst: subst)
            cell.selectionStyle = .none
//                cell.configCell(type: item, row: indexPath.row)
            return cell
        case 1:
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
            cell.textLabel?.text = "Receita"
            cell.selectionStyle = .none
            if listaReceitas.isEmpty {
                tableView.setEmptyView(title: "", message: "Nenhuma receita disponivel")
                tableView.isScrollEnabled = false
            }
            return cell
        case 2:
            let cell = ReceitaCardTableViewCell()
            cell.receitaTable = listaReceitas[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.row) - Row: \(indexPath.section)")
        if indexPath.section == 2 {
            let cell = tableView.cellForRow(at: indexPath) ?? UITableViewCell()
            animateCell(cell: cell)
            
            let viewController = DescricaoReceitaViewController()
            viewController.receita = listaReceitas[indexPath.row]
            rootViewController?.pushViewController(viewController, animated: true)
        }
    }

    func animateCell(cell: UITableViewCell) {
        let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: animationOptions, animations: {
                        cell.transform = .init(scaleX: 0.9, y: 0.9)
                       }, completion: { _ in
                        UIView.animate(withDuration: 0.2,
                                       delay: 0,
                                       usingSpringWithDamping: 1,
                                       initialSpringVelocity: 0,
                                       options: animationOptions, animations: {
                                        cell.transform = .identity
                                       }, completion: nil)
                       })
    }
}
