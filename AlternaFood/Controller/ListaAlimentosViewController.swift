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
    var photoGridCollectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.title = "Alimentos"
        
        setUpCollectionview()
        
        //search config
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //some code here
    }
}

extension ListaAlimentosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setUpCollectionview() {

        let layout = CustomCollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 30, left: 40, bottom: 100, right: 40)
//        layout.itemSize = CGSize(width: view.frame.width*0.37, height: view.frame.height*0.27)

        photoGridCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        view.addSubview(photoGridCollectionView ?? UICollectionView())
        setCollectionViewDelegates()
        photoGridCollectionView?.backgroundColor = .systemBackground

        photoGridCollectionView?.register(CustomCell.self, forCellWithReuseIdentifier: "MyCell")
    }

    func setCollectionViewDelegates() {
        photoGridCollectionView?.delegate = self
        photoGridCollectionView?.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }

        return cell
    }
}
