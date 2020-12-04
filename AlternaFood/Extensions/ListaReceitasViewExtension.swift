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
        let viewController = DescricaoReceitaViewController()
        viewController.receita = listaReceitas[indexPath.row]
        rootViewController?.pushViewController(viewController, animated: true)
    }

}
