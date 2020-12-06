//
//  JsonParser.swift
//  AlternaFood
//
//  Created by Leonardo Gomes on 23/11/20.
//
//swiftlint:disable force_try

import Foundation
import CoreData

class JsonParser {
    
    var alimentoJson = "AlimentoData"
    var substitutoJson = "SubstitutoData"
    var receitasJson = "ReceitaData"
    
    func parsingAlimentos() -> [JSAlimento] {
        
        let decoder = JSONDecoder()
        var alimentos: [JSAlimento] = []
        
        do {
            if let bundlePath = Bundle.main.path(forResource: alimentoJson, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                alimentos = try! decoder.decode([JSAlimento].self, from: jsonData)
                
                return alimentos
            }
        } catch {
            print(error)
        }
        return alimentos
    }
    
    func populateAlimentoCD() -> Bool {
        
        let cdManeger = CDManager()
        
        let alimentos: [JSAlimento] = self.parsingAlimentos()
        
        for alimento in alimentos {
            if !cdManeger.saveAlimento(uuidAlimento: alimento.alimentoID, nomeAlimento: alimento.aliemntoNome, pathImageAlimento: alimento.alimentoFoto) {
                return false
            }
        }
        return true
    }
    
    func parsingSubstitutos() -> [JSSubstituto] {
        
        let decoder = JSONDecoder()
        var substitutos: [JSSubstituto] = []
        
        do {
            if let bundlePath = Bundle.main.path(forResource: substitutoJson, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                substitutos = try! decoder.decode([JSSubstituto].self, from: jsonData)
                return substitutos
            }
        } catch {
            print(error)
        }
        return substitutos
    }
    
    func populateSubstitutosCD() -> Bool {
        let cdManeger = CDManager()
        
        let substitutos: [JSSubstituto] = self.parsingSubstitutos()
        
        for substituto in substitutos {
            if !cdManeger.saveSubstituto(uuidSubstituto: substituto.substitutoID,
                                         nomeSubstituto: substituto.substitutoNome,
                                         descricaoSubstituto: substituto.substitutoDescricao,
                                         pathImage: substituto.substitutoFoto,
                                         pathIcon: substituto.substitutoIcon) {
                return false
            }
        }
        return true
    }
    
    func addSubstitutosToAlimentos() -> Bool {
        
        let cdManager = CDManager()
        let alimentos = self.parsingAlimentos()
        
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
                        if !cdManager.saveContext() {
                            return false
                        }
                    }
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                    return false
                }
            }
        }
        return true
    }
    
    func parsingReceitas() -> [JSReceita] {
        let decoder = JSONDecoder()
        var receitas: [JSReceita] = []
        
        do {
            if let bundlePath = Bundle.main.path(forResource: receitasJson, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                receitas = try! decoder.decode([JSReceita].self, from: jsonData)
                return receitas
            }
        } catch {
            print(error)
        }
        return receitas
    }
    
    func populateReceitasCD() -> Bool {
        let cdManeger = CDManager()
        
        let receitas: [JSReceita] = self.parsingReceitas()
        
        for receita in receitas {
            if !cdManeger.saveReceita(idAReceita: receita.idReceita,
                                      nomeReceita: receita.nome, porcoes: receita.porcoes, tempo: receita.tempo, ingredientes: receita.ingredientes, preparo: receita.preparo, pathImage: receita.pathFoto, idAlimentoFrom: receita.idAlimento) {
                return false
            }
        }
        return true
    }
}
