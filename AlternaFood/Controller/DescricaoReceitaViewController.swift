//
//  DescricaoReceitaViewController.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 30/11/20.
//

import UIKit

class DescricaoReceitaViewController: UIViewController {

    let headerImage = HeaderImageView()
    let descricaoReceitaView = DescricaoReceitaView()
    
    var receita: Receita? {
        didSet {
            if receita?.imageReceita! == ""{
                headerImage.imageHeader.image = UIImage(named: "emptyStateCardFoto")
            } else {
                headerImage.imageHeader.image = UIImage(named: receita?.imageReceita ?? "emptyStateCardFoto")
            }
            descricaoReceitaView.receita = receita
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor2")
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "exclamationmark.square"), style: .plain, target: self, action: #selector(reportReceita))
        
        configHeaderImageView()
        configDescricaoReceitaView()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor2")
        navigationController?.navigationBar.barStyle = .default
    }
    
    func configHeaderImageView() {
        view.addSubview(headerImage)
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.32),
            headerImage.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func configDescricaoReceitaView() {
        view.addSubview(descricaoReceitaView)
        descricaoReceitaView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descricaoReceitaView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descricaoReceitaView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            descricaoReceitaView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            descricaoReceitaView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    @objc func reportReceita() {
        print("Receita reported")
    }
}
