//
//  JsonParser.swift
//  AlternaFood
//
//  Created by Leonardo Gomes on 23/11/20.
//
//swiftlint:disable force_try

import Foundation
import CoreData

func parsingAlimentos() -> [JSAlimento] {
    
    let decoder = JSONDecoder()
    var alimentos: [JSAlimento] = []
    
    do {
        if let bundlePath = Bundle.main.path(forResource: "AlimentoData", ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            alimentos = try! decoder.decode([JSAlimento].self, from: jsonData)
            
            return alimentos
        }
    } catch {
        print(error)
    }
    return alimentos
}

func populateAlimentoCD() {
    
    let cdManeger = CDManager()
    
    let alimentos: [JSAlimento] = parsingAlimentos()
    
    for alimento in alimentos {
        cdManeger.saveAlimento(uuidAlimento: alimento.alimentoID, nomeAlimento: alimento.aliemntoNome, pathImageAlimento: alimento.alimentoFoto)
    }
}

func parsingSubstitutos() -> [JSSubstituto] {
    
    let decoder = JSONDecoder()
    var substitutos: [JSSubstituto] = []
    
    do {
        if let bundlePath = Bundle.main.path(forResource: "SubstitutoData", ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            
            substitutos = try! decoder.decode([JSSubstituto].self, from: jsonData)
            return substitutos
        }
    } catch {
        print(error)
    }
    return substitutos
}

func populateSubstitutosCD() {
    let cdManeger = CDManager()
    
    let substitutos: [JSSubstituto] = parsingSubstitutos()
    
    for substituto in substitutos {
        cdManeger.saveSubstituto(uuidSubstituto: substituto.substitutoID,
                                 nomeSubstituto: substituto.substitutoNome,
                                 descricaoSubstituto: substituto.substitutoDescricao,
                                 pathImage: substituto.substitutoFoto,
                                 pathIcon: substituto.substitutoIcon)
    }
}

func addSubstitutosToAlimentos() {
    
    let cdManager = CDManager()
    let alimentos = parsingAlimentos()
    
    let requestSubst = Substituto.fetchRequest() as NSFetchRequest<Substituto>
    
    for alimento in alimentos {
        print("\n"+alimento.aliemntoNome)
        for idSubt in alimento.alimentoSubstitutos {
            
            requestSubst.predicate = NSPredicate(format: "idSubstituto == %@", idSubt)
            
            do {
                let subts =  try cdManager.viewContext.fetch(requestSubst)
                for sub in subts {
                    print(sub.nomeSubstituto!+" - "+idSubt)
                    let newAliem = cdManager.requestAlimentoByID(uuid: alimento.alimentoID)
                    newAliem.addToSubstitutosAlimento(sub)
                    cdManager.saveContext()
                }
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
}
