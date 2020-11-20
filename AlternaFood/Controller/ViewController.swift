//
//  ViewController.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 18/11/20.
//

import UIKit
import Cosmos

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let card = CardCollectionViewCell()
    var photoGridCollectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        view.backgroundColor = .systemBackground
        setUpCollectionview()
//        view.addSubview(card)
//        card.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            card.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            card.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.27),
//            card.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.37)
//        ])
    }

    func setUpCollectionview() {

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: (view.frame.width/2) - 15, height: 250)

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
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }

        //guard let data = UserDefaults.standard.object(forKey: "\(indexPath.row)") as? Data else { return UICollectionViewCell() }

        //cell.photo.image = UIImage(data: data)

        return cell
    }
}
