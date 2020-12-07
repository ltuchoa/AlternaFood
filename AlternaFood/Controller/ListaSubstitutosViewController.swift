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
    
    var idAlimento: UUID?
    var substitutos: [Substituto] = []

    override func viewDidLoad() {
        configNav()
        view.backgroundColor = .systemBackground
        setUpCollectionview()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
//    }
    
    func configNav() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Substitutos"
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
    }
}
