//
//  ListaReceitasViewExtension.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 30/11/20.
//

import UIKit

extension ListaReceitasView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ReceitaCardTableViewCell()
        return cell
    }

}
