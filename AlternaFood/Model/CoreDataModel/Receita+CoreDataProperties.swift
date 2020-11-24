//
//  Receita+CoreDataProperties.swift
//  
//
//  Created by Leonardo Gomes Fernandes on 20/11/20.
//
//

import Foundation
import CoreData

extension Receita {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Receita> {
        return NSFetchRequest<Receita>(entityName: "Receita")
    }

    @NSManaged public var idReceita: UUID?
    @NSManaged public var nomeReceita: String?
    @NSManaged public var imageReceita: Data?
    @NSManaged public var tempoPreparoReceita: String?
    @NSManaged public var porcaoReceita: Int64
    @NSManaged public var ingredientesReceita: [String]?
    @NSManaged public var preparoReceita: [String]?
    @NSManaged public var substitutoReceita: Substituto?

}
