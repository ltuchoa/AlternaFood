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
        self.navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.barStyle = .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lista.rootViewController = self.navigationController
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.title = "Receitas"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRecipe))
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
        lista.listaReceitas = cdManager.listaReceitas()
        
        setupSearchBar()
        setupViewConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        switch lista.segmented.selectedSegmentIndex {
        case 0:
            lista.scopeAll()
        case 1:
            lista.scopeSaved()
        default:
            break
        }

    }
    
    @objc func addRecipe() {
        let add = AdicionarReceitaViewController()
        self.present(add, animated: true, completion: .none)
    }
    
    func setupSearchBar() {
        let search = UISearchController(searchResultsController: nil)
        UISearchBar.appearance().tintColor = UIColor.init(named: "actionColor")
        search.searchBar.setValue("Cancelar", forKey: "cancelButtonText")
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "Pesquisa"
        search.obscuresBackgroundDuringPresentation = false
        self.navigationItem.searchController = search
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let nomeSearch = searchController.searchBar.text else { return }
        
        lista.tableView.reloadData()
        
        if !nomeSearch.isEmpty {
            let listaToOrder = cdManager.requestReceitaByName(nome: nomeSearch)
            lista.listaReceitas = listaToOrder.sorted(by: { $0.nomeReceita! < $1.nomeReceita! })
            lista.scopeSearch()
        } else {
            let listaToOrder = cdManager.listaReceitas()
            lista.listaReceitas = listaToOrder.sorted(by: { $0.nomeReceita! < $1.nomeReceita! })
            lista.scopeSearch()
        }
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
