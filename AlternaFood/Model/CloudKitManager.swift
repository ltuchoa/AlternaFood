//
//  CloudKitManager.swift
//  AlternaFood
//
//  Created by Nathalia Cardoso on 03/12/20.
//

import Foundation
import CloudKit

class CKManager {
    
    let privateDatabase = CKContainer.default().privateCloudDatabase
    let publicDatabase = CKContainer.default().publicCloudDatabase
    
    func saveRecipeToCloud(uuid: UUID) {
        let recipe = CKRecord(recordType: "Recipe")
        recipe.setValue(uuid.debugDescription, forKey: "content")
        
        privateDatabase.save(recipe) { (record, error) in
            if let error = error {
                print(error)
            }
            guard let record = record else { return }
            print("saved \(record)")
        }
    }
    
    func unsaveRecipe(uuid: UUID) {
        let query = CKQuery(recordType: "Recipe", predicate: NSPredicate(value: true))
        privateDatabase.perform(query, inZoneWith: nil) { (records, _) in
            guard let records = records else { return }
            for record in records {
                guard let content = record.value(forKey: "content") else { return }
                if content as? String == uuid.debugDescription {
                    self.deleteRecipeFromDatabase(recordID: record.recordID)
                }
            }
        
        }
    }
    
    func isSavedRecipe(uuid: UUID) -> Bool {
        var result: Bool = false
        let query = CKQuery(recordType: "Recipe", predicate: NSPredicate(value: true))
        privateDatabase.perform(query, inZoneWith: nil) { (records, _) in
            guard let records = records else { return }
            for record in records {
                guard let content = record.value(forKey: "content") else { return }
                if content as? String == uuid.debugDescription {
                    result = true
                }
            }
        
        }
        return result
    }
    
    func deleteRecipeFromDatabase(recordID: CKRecord.ID) {
        privateDatabase.delete(withRecordID: recordID) { (record, error) in
            if let error = error {
                print(error)
            }
            if let record = record {
                print(record)
            }
        }
    }
    
    func queryRecipeDatabase() {
        let query = CKQuery(recordType: "Recipe", predicate: NSPredicate(value: true))
        privateDatabase.perform(query, inZoneWith: nil) { (records, _) in
            guard let records = records else { return }
            for record in records {
                print(record)
                guard let content = record.value(forKey: "content") else { return }
                print(content)
            }
        }
    }
    
    func rateRecipe(note: Float, uuid: UUID) {
        //print(uuid.debugDescription)
        let nota = CKRecord(recordType: "Rate")
        nota.setValue(uuid.debugDescription, forKey: "content")
        nota.setValue(note, forKey: "NotaGeral")
        //nota.setObject(note, forKey: "NotaGeral")
        
        privateDatabase.save(nota) { (record, error) in
            if let error = error {
                print(error)
            }
            guard let record = record else { return }
            print("saved \(record)")
        }
    }
    
    func saveNewRateToCloud(newRate: Float, uuid: UUID) {
        let nota = CKRecord(recordType: "PublicRate")
        nota.setValue(newRate, forKey: "rate")

        publicDatabase.save(nota) { (record, error) in
            if let error = error {
                print(error)
            }

            guard let record = record else { return }
            print("saved \(record)")
        }
    }

    func getRateRecipe(recipeName: String) {
        let query = CKQuery(recordType: recipeName, predicate: NSPredicate(value: true))
        publicDatabase.perform(query, inZoneWith: nil) { (records, _) in
            guard let records = records else { return }
            for record in records {
                print(record)
                guard let content = record.value(forKey: "rate") else { return }
                print(content)
            }
        }
    }
}
