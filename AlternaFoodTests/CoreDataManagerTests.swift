//
//  CoreDataManagerTests.swift
//  AlternaFoodTests
//
//  Created by Leonardo Gomes on 27/11/20.
//

import UIKit
import XCTest

@testable import AlternaFood

class CoreDataManagerTests: XCTestCase {
    
    func test_CDManager_saveContext_true() {
        // Given
        let cdManager = CDManager()
        
        // When
        let resultSaveContx = cdManager.saveContext()
        
        // Then
        XCTAssertTrue(resultSaveContx)
    }
    
    func test_CDManager_saveAlimento_true() {
        // Given
        let cdManager = CDManager()
        
        // When
        let resultSaveAli = cdManager.saveAlimento(uuidAlimento: "A7F10846-5F08-4A79-B2C8-CC5845FF8A7B", nomeAlimento: "Alimento", pathImageAlimento: "alimentoIcon")
        
        // Then
        XCTAssertTrue(resultSaveAli)
    }
    
    func test_CDManager_saveSubstituto_true() {
        // Given
        let cdManager = CDManager()
        
        // When
        let resultSaveSubs = cdManager.saveSubstituto(uuidSubstituto: "28AF392D-6576-4116-A6DC-0EE9147727B6",
                                                      nomeSubstituto: "Substituto",
                                                      descricaoSubstituto: "Descrição Substituto",
                                                      pathImage: "substitutoFoto",
                                                      pathIcon: "substitutoIcon")
        
        // Then
        XCTAssertTrue(resultSaveSubs)
    }
    
    func test_CDManager_listaAliemntos_Array() {
        // Given
        let cdManager = CDManager()
        
        // When
        let listaAliemntos = cdManager.listaAlimentos()
        
        // Then
        XCTAssertNotNil(listaAliemntos)
    }
    
    func test_CDManager_listaSubstitutos_Array() {
        // Given
        let cdManager = CDManager()
        
        // When
        let listaSubstitutos = cdManager.listaSubstitutos()
        
        // Then
        XCTAssertNotNil(listaSubstitutos)
    }
    
    func test_CDManager_requestAlimentoByID_Alimento() {
        // Given
        let cdManager = CDManager()
        let alimentoTest: Alimento = Alimento(context: cdManager.viewContext)
        
        // When
        
        _ = cdManager.saveAlimento(uuidAlimento: "A8F10846-5F08-4A79-B2C8-CC5845FF8A7B", nomeAlimento: "Alimento", pathImageAlimento: "alimentoIcon")
        
        alimentoTest.nomeAlimento = "Alimento"
        alimentoTest.idAlimento = UUID(uuidString: "A8F10846-5F08-4A79-B2C8-CC5845FF8A7B")
        alimentoTest.pathImageAlimento = "alimentoIcon"
        
        let alimento = cdManager.requestAlimentoByID(uuid: "A8F10846-5F08-4A79-B2C8-CC5845FF8A7B")
        
        // Then
        XCTAssertEqual(alimento.idAlimento, alimentoTest.idAlimento)
    }
    
    func test_CDManager_requestAlimentoByName_Alimento() {
        // Given
        let cdManager = CDManager()
        let alimentoTest: Alimento = Alimento(context: cdManager.viewContext)
        
        // When
        _ = cdManager.saveAlimento(uuidAlimento: "A8F10846-5F08-4A79-E2C8-CC5845FF8A7B", nomeAlimento: "Marshmelo", pathImageAlimento: "alimentoIcon")
        
        alimentoTest.nomeAlimento = "Marshmelo"
        alimentoTest.idAlimento = UUID(uuidString: "A8F10846-5F08-4A79-E2C8-CC5845FF8A7B")
        alimentoTest.pathImageAlimento = "alimentoIcon"
        
        let alimento = cdManager.requestAlimentoByName(nome: "Marshmelo")[0]
        
        // Then
        XCTAssertEqual(alimento.nomeAlimento, alimentoTest.nomeAlimento)
    }
}
