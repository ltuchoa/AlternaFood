//
//  ViewController.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 18/11/20.
//

import UIKit
import Cosmos
//swiftlint:disable trailing_whitespace
class ListaAlimentosViewController: UIViewController, UISearchResultsUpdating {

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
        
        //search config
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //some code here
    }
}
