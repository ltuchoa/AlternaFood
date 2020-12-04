//
//  ListaReceitasViewController.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 25/11/20.
//

import UIKit

class ListaReceitasViewController: UIViewController, UISearchResultsUpdating {

    let lista = ListaReceitasView()
    
    let cdManager = CDManager()
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.tintColor = UIColor.black
//        navigationController?.navigationBar.barStyle = .black
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lista.rootViewController = self.navigationController
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.title = "Receitas"

        let listaDeReceitas = cdManager.listaReceitas()
        lista.listaReceitas = listaDeReceitas
        
        setupSearchBar()
        setupViewConstraints()
    }
    
    func setupSearchBar() {
        let search = UISearchController(searchResultsController: nil)
        UISearchBar.appearance().tintColor = UIColor.init(named: "actionColor")
        search.searchBar.setValue("Cancelar", forKey: "cancelButtonText")
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        self.navigationItem.searchController = search
    }

    func updateSearchResults(for searchController: UISearchController) {
        // To be done when CloudKit is ready.
    }

    func setupViewConstraints() {
        self.view.addSubview(lista)
        self.lista.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.lista.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8),
            self.lista.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.lista.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.lista.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

}
