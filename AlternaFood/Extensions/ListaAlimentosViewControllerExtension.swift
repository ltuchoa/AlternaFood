//
//  ListaAlimentosViewControllerExtension.swift
//  AlternaFood
//
//  Created by Nathalia Cardoso on 23/11/20.
//

import Foundation
import UIKit
import Hero

extension ListaAlimentosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setUpCollectionview() {

        let layout = CustomCollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 30, left: 40, bottom: 100, right: 40)
//        layout.itemSize = CGSize(width: view.frame.width*0.37, height: view.frame.height*0.27)

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        view.addSubview(collectionView ?? UICollectionView())
        setCollectionViewDelegates()
        collectionView?.backgroundColor = .systemBackground

        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: "MyCell")
    }

    func setCollectionViewDelegates() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        alimentos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        
        cell.card.name.text = alimentos[indexPath.row].nomeAlimento ?? "Aliemnto"
        cell.card.icon.image = UIImage(named: alimentos[indexPath.row].pathImageAlimento ?? "receitas_icon")

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) ?? UICollectionViewCell()
        animateCell(cell: cell)

        print("User tapped on item \(indexPath.row)")
        let viewController = ListaSubstitutosViewController()
        viewController.idAlimento = alimentos[indexPath.row].idAlimento
        viewController.nomeAlimento = alimentos[indexPath.row].nomeAlimento
        navigationItem.backBarButtonItem = UIBarButtonItem(title: alimentos[indexPath.row].nomeAlimento, style: .plain, target: self, action: #selector(popToPrevious))
        let substitutosOrder = alimentos[indexPath.row].listaSubstitutos
        viewController.substitutos = substitutosOrder.sorted(by: { $0.nomeSubstituto! < $1.nomeSubstituto! })
        showHero(viewController, navigationAnimationType: .pull(direction: .left))
    }

    func animateCell(cell: UICollectionViewCell) {
        let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: animationOptions, animations: {
                        cell.transform = .init(scaleX: 0.9, y: 0.9)
                       }, completion: { _ in
                        UIView.animate(withDuration: 0.2,
                                       delay: 0,
                                       usingSpringWithDamping: 1,
                                       initialSpringVelocity: 0,
                                       options: animationOptions, animations: {
                                        cell.transform = .identity
                                       }, completion: nil)
                       })
    }
    
    @objc private func popToPrevious() {
        
        navigationController?.popViewController(animated: true)
    }
    
}
