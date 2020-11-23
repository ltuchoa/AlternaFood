//
//  Substituto+CoreDataProperties.swift
//  
//
//  Created by Leonardo Gomes Fernandes on 20/11/20.
//
//

import Foundation
import CoreData

extension Substituto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Substituto> {
        return NSFetchRequest<Substituto>(entityName: "Substituto")
    }

    @NSManaged public var idSubstituto: UUID?
    @NSManaged public var nomeSubstituto: String?
    @NSManaged public var imageSubstituto: Data?
    @NSManaged public var descricaoSubstituto: String?
    @NSManaged public var alimentoSubstituto: NSSet?
    @NSManaged public var receitasSubstituto: NSSet?

}

// MARK: Generated accessors for alimentoSubstituto
extension Substituto {

    @objc(addAlimentoSubstitutoObject:)
    @NSManaged public func addToAlimentoSubstituto(_ value: Alimento)

    @objc(removeAlimentoSubstitutoObject:)
    @NSManaged public func removeFromAlimentoSubstituto(_ value: Alimento)

    @objc(addAlimentoSubstituto:)
    @NSManaged public func addToAlimentoSubstituto(_ values: NSSet)

    @objc(removeAlimentoSubstituto:)
    @NSManaged public func removeFromAlimentoSubstituto(_ values: NSSet)

}

// MARK: Generated accessors for receitasSubstituto
extension Substituto {

    @objc(addReceitasSubstitutoObject:)
    @NSManaged public func addToReceitasSubstituto(_ value: Receita)

    @objc(removeReceitasSubstitutoObject:)
    @NSManaged public func removeFromReceitasSubstituto(_ value: Receita)

    @objc(addReceitasSubstituto:)
    @NSManaged public func addToReceitasSubstituto(_ values: NSSet)

    @objc(removeReceitasSubstituto:)
    @NSManaged public func removeFromReceitasSubstituto(_ values: NSSet)

}
