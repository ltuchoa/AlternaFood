//
//  DescriptionViewController.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 21/11/20.
//

import UIKit

class DescriptionViewController: UIViewController {

    let maskImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "maskFoto"))
        return image
    }()

    let imageHeader: UIImageView = {
        let image = UIImageView(image: UIImage(named: "jacaFoto"))
        return image
    }()
    
    let descriptionView = DescriptionView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        DispatchQueue.main.async {
            self.configDescriptionView()
        }
        configImageHeader()
        configMaskFoto()
        configNav()
      
    }

    
    
    func configNav() {
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor2")

    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
    }
    
    func configImageHeader() {
        view.addSubview(imageHeader)
        imageHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageHeader.topAnchor.constraint(equalTo: view.topAnchor),
            imageHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3268),
            imageHeader.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ])
    }
    
    func configMaskFoto() {
        view.addSubview(maskImage)
        maskImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maskImage.topAnchor.constraint(equalTo: imageHeader.topAnchor),
            maskImage.bottomAnchor.constraint(equalTo: imageHeader.bottomAnchor),
            maskImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3268),
            maskImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ])
    }
    
    func configDescriptionView() {
        view.addSubview(descriptionView)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            descriptionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70),
            descriptionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ])
    }
    

}

