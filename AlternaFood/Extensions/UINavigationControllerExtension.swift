//
//  UINavigationControllerExtension.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 30/11/20.
//

import Foundation
import UIKit

extension UINavigationController {
    
    var rootViewController: UIViewController? {
        return viewControllers.first
    }
}
