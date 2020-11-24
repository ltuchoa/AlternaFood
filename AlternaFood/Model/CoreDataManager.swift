//
//  CoreDataManager.swift
//  AlternaFood
//
//  Created by Leonardo Gomes Fernandes on 20/11/20.
//

import Foundation
import CoreData
import UIKit

class CDManager {

    let viewContext = ((UIApplication.shared.delegate as? AppDelegate) ?? AppDelegate()).persistentContainer.viewContext

    func saveAlimento(nomeAlimento: String, imageAlimento: UIImage ) {

        let alimento = Alimento(context: self.viewContext)
        alimento.idAlimento = UUID()
        alimento.nomeAlimento = nomeAlimento

        do {

            try viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

    }

    func saveSubstituto() {

    }

    func listaAlimentos() -> [Alimento] {

        var listaDeAlimentos: [Alimento] = []
        do {
            let request = Alimento.fetchRequest() as NSFetchRequest<Alimento>

            listaDeAlimentos = try viewContext.fetch(request)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

        return listaDeAlimentos
    }

    func listaSubstitutos() {

    }
}
