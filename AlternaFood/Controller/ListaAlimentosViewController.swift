//
//  ViewController.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 18/11/20.
//

import UIKit
import Cosmos
//swiftlint:disable trailing_whitespace
class ListaAlimentosViewController: UIViewController, UISearchResultsUpdating, UISearchControllerDelegate {

    let card = CardCollectionViewCell()
    var collectionView: UICollectionView?
    
    let cdManeger = CDManager()
    var alimentos: [Alimento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.title = "Alimentos"
        
        setUpCollectionview()
        setCollectionViewDelegates()
        
        alimentos = cdManeger.listaAlimentos()
        
        print(alimentos.count)
        
        setUpSearchBar()

    }
    
    func setUpSearchBar() {
        let search = UISearchController(searchResultsController: nil)
        UISearchBar.appearance().tintColor = UIColor.init(named: "actionColor")
        search.searchBar.placeholder = "Pesquisa"
        search.searchBar.setValue("Cancelar", forKey: "cancelButtonText")
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        self.navigationItem.searchController = search
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let nomeSearch = searchController.searchBar.text else { return }

        if !nomeSearch.isEmpty {
            alimentos = cdManeger.requestAlimentoByName(nome: nomeSearch)
            collectionView?.reloadData()
        } else {
            alimentos = cdManeger.listaAlimentos()
            collectionView?.reloadData()
        }
        
    }
}
