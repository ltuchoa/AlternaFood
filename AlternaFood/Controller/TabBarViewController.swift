//
//  TabBarViewController.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 18/11/20.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let alimentos = UINavigationController(rootViewController: ListaAlimentosViewController())
        alimentos.tabBarItem = UITabBarItem(title: "Alimentos", image: UIImage(named: "lista_icon"), tag: 0)

        let receitas = UINavigationController(rootViewController: ListaReceitasViewController())
        receitas.tabBarItem = UITabBarItem(title: "Receitas", image: UIImage(named: "receitas_icon"), tag: 1)
        
        let tabBarList = [alimentos, receitas]
        setupStyle()
        viewControllers = tabBarList
    }

    func setupStyle() {
        tabBar.tintColor = UIColor.init(named: "actionColor")
        tabBar.unselectedItemTintColor = UIColor.init(named: "tabColor")
        tabBar.isTranslucent = false
    }

    func removeSeparetor() {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
