//
//  Alimento+CoreDataProperties.swift
//  
//
//  Created by Leonardo Gomes Fernandes on 20/11/20.
//
//

import Foundation
import CoreData

extension Alimento {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alimento> {
        return NSFetchRequest<Alimento>(entityName: "Alimento")
    }

    @NSManaged public var idAlimento: UUID?
    @NSManaged public var nomeAlimento: String?
    @NSManaged public var imageAlimento: Data?
    @NSManaged public var substitutosAlimento: NSSet?

}

// MARK: Generated accessors for substitutosAlimento
extension Alimento {

    @objc(addSubstitutosAlimentoObject:)
    @NSManaged public func addToSubstitutosAlimento(_ value: Substituto)

    @objc(removeSubstitutosAlimentoObject:)
    @NSManaged public func removeFromSubstitutosAlimento(_ value: Substituto)

    @objc(addSubstitutosAlimento:)
    @NSManaged public func addToSubstitutosAlimento(_ values: NSSet)

    @objc(removeSubstitutosAlimento:)
    @NSManaged public func removeFromSubstitutosAlimento(_ values: NSSet)

}
