//
//  AddStepFourView.swift
//  AlternaFood
//
//  Created by Paulo Uchôa on 15/12/20.
//

import UIKit

class AddStepFourView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constraintFotoLabel()
        constraintFotoButton()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let fotoLabel: UILabel = {
        let title = UILabel()
        title.text = "Adicione uma foto para a receita:"
        title.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return title
    }()
    
//    let fotoImage: UIImage = {
//        let foto = UIImage()
//        return foto
//    }()
    
    let fotoButton: UIButton = {
        let foto = UIButton(type: .custom)
//        button.frame = CGRect(x: 0.0, y: 0.0, width: 50, height: 50)
        foto.setTitle("Cancelar", for: .normal)
        foto.setTitleColor(UIColor.init(named: "actionColor"), for: .normal)
        foto.addTarget(self, action: #selector(fotoButtonTapped(fotoButton:_:)), for: UIControl.Event.touchUpInside)
        return foto
    }()
    
    func constraintFotoLabel() {
        addSubview(fotoLabel)
        fotoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fotoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            fotoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    func constraintFotoButton() {
        addSubview(fotoButton)
        fotoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fotoButton.topAnchor.constraint(equalTo: fotoLabel.bottomAnchor, constant: 15),
            fotoButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
    
    @objc func fotoButtonTapped(fotoButton: UIButton,_ sender:UIBarButtonItem!) {
        print("ola")
        let fotoPick = UIImagePickerController()
        fotoPick.sourceType = .photoLibrary
        fotoPick.delegate = self
        fotoPick.allowsEditing = true
        fotoPick.present(fotoPick, animated: true )
        
    }
}

extension AddStepFourView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
//        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
//            fotoImage = image
//        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
