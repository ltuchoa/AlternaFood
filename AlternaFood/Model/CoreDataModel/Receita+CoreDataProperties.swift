//
//  Receita+CoreDataProperties.swift
//  
//
//  Created by Leonardo Gomes Fernandes on 06/12/20.
//
//

import Foundation
import CoreData

extension Receita {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Receita> {
        return NSFetchRequest<Receita>(entityName: "Receita")
    }

    @NSManaged public var idAlimentoFrom: UUID?
    @NSManaged public var idSubstituto: UUID?
    @NSManaged public var idReceita: UUID?
    @NSManaged public var imageReceita: String?
    @NSManaged public var ingredientesReceita: [String]?
    @NSManaged public var nomeReceita: String?
    @NSManaged public var porcaoReceita: String?
    @NSManaged public var preparoReceita: [String]?
    @NSManaged public var tempoPreparoReceita: String?
    @NSManaged public var substitutoReceita: Substituto?

}
