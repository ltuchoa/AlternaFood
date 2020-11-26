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
    
    func saveContext() {
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    func saveAlimento(uuidAlimento: String, nomeAlimento: String, pathImageAlimento: String ) {

        let alimento = Alimento(context: self.viewContext)
        alimento.idAlimento = UUID(uuidString: uuidAlimento)
        alimento.nomeAlimento = nomeAlimento
        alimento.pathImageAlimento = pathImageAlimento

        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

    }

    func saveSubstituto(uuidSubstituto: String, nomeSubstituto: String, descricaoSubstituto: String, pathImage: String, pathIcon: String) {
        
        let substituto = Substituto(context: self.viewContext)
        substituto.idSubstituto = UUID(uuidString: uuidSubstituto)
        substituto.nomeSubstituto = nomeSubstituto
        substituto.descricaoSubstituto = descricaoSubstituto
        substituto.pathImageSubstituto = pathImage
        substituto.pathIconSubstituto = pathIcon
        
        do {
            try viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

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

    func listaSubstitutos() -> [Substituto] {
        
        var listaDeSubstitutos: [Substituto] = []
        
        do {
            let request = Substituto.fetchRequest() as NSFetchRequest<Substituto>
            
            listaDeSubstitutos = try viewContext.fetch(request)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return listaDeSubstitutos
    }
    
    func requestAlimentoByID(uuid: String) -> Alimento {
        let requestAlim = Alimento.fetchRequest() as NSFetchRequest<Alimento>
        requestAlim.predicate = NSPredicate(format: "idAlimento == %@", uuid)
        
        do {
            let alimentos = try viewContext.fetch(requestAlim)
            return alimentos[0]
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return Alimento()
    }
    
}
