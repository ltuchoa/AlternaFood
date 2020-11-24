//
//  ViewAvulsa.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 19/11/20.
//

import Foundation
import UIKit

class ListaSubstitutosViewController: UIViewController {

    var collectionView: UICollectionView?

    override func viewDidLoad() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Substitutos"
        view.backgroundColor = .systemBackground
        setUpCollectionview()
    }
}
