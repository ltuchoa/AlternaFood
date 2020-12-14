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
    var nomeAlimento: String?
    var substitutos: [Substituto] = []
    
    override func viewDidLoad() {
        configNav()
        view.backgroundColor = .systemBackground
        setUpCollectionview()
    }
    
    func configNav() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
        
        self.title = "Substitutos"
        
        //        if let titleName = nomeAlimento {
        //            self.title = "Substitutos de "+titleName
        //        } else {
        //            self.title = "Substitutos"
        //        }
    }

}
