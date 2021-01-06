//
//  StepFourViewController.swift
//  AlternaFood
//
//  Created by Larissa Uchoa on 16/12/20.
//

import UIKit

class StepFourViewController: UIViewController {

    let stepFour = AddStepFourView()
    
    let fotoButton: UIButton = {
        let foto = UIButton(type: .custom)
//        foto.setTitle("Cancelar", for: .normal)
        foto.setImage(UIImage(named: "addImageButtom"), for: .normal)
//        foto.tintColor = UIColor.init(named: "actionColor")
//        foto.backgroundColor = UIColor.init(named: "backGroundButtomMask")
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.addTarget(self, action: #selector(fotoButtonTapped(fotoButton:_:)), for: UIControl.Event.touchUpInside)
        return foto
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        constraintStepFour()
        constraintFotoButton()
        
    }

    func setupNavBar() {
        self.title = "Nova Receita"
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "actionColor")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: #selector(nextStep))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(backView))
    }

    @objc func nextStep() {
        
    }

    @objc func backView() {
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func fotoButtonTapped(fotoButton: UIButton,_ sender:UIBarButtonItem!) {
        print("ola")
        let fotoPick = UIImagePickerController()
        fotoPick.delegate = self
        fotoPick.allowsEditing = true
        fotoPick.sourceType = .photoLibrary
        present(fotoPick, animated: true )
       
    }

    func constraintStepFour() {
        view.addSubview(stepFour)
        stepFour.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepFour.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stepFour.leftAnchor.constraint(equalTo: view.leftAnchor),
            stepFour.rightAnchor.constraint(equalTo: view.rightAnchor),
            stepFour.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func constraintFotoButton() {
        stepFour.addSubview(fotoButton)
        fotoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fotoButton.bottomAnchor.constraint(equalTo: stepFour.fotoImage.bottomAnchor, constant: -1),
            fotoButton.rightAnchor.constraint(equalTo: stepFour.fotoImage.rightAnchor, constant: -1),
            fotoButton.heightAnchor.constraint(equalToConstant: 50.0),
            fotoButton.widthAnchor.constraint(equalToConstant: 50.0)
        ])
    }

}

extension StepFourViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            stepFour.fotoImage.image = image
        }

        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
