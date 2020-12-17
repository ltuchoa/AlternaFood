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
        guard let uuid = UUID(uuidString: "07BA6D10-9FE4-456A-937D-66C126F5F676") else { return }
        CKManager().getRateRecipe(recipeID: uuid) { (result) in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
