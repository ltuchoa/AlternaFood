//
//  ListaReceitasViewExtension.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 30/11/20.
//

import UIKit

extension ListaReceitasView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaReceitas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ReceitaCardTableViewCell()
        let receita = listaReceitas[indexPath.row]
//        print(receita.nomeReceita)
        cell.receitaTable = receita
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath) ?? UITableViewCell()
        animateCell(cell: cell)

        let viewController = DescricaoReceitaViewController()
        viewController.receita = listaReceitas[indexPath.row]
        rootViewController?.pushViewController(viewController, animated: true)
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
