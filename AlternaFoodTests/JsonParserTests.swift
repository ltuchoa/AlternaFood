//
//  JsonParserTests.swift
//  AlternaFoodTests
//
//  Created by Leonardo Gomes on 27/11/20.
//

import UIKit
import XCTest

@testable import AlternaFood

class JsonParserTests: XCTestCase {

    func test_JsonParser_parsingAlimentos_ArrayFull() {
        // Given
        let jsonParser = JsonParser()
        
        // When
        let alimentosJS = jsonParser.parsingAlimentos()
        
        // Then
        XCTAssertNotNil(alimentosJS)
    }
    
    func test_JsonParser_parsingAlimentos_EmptyArray() {
        // Given
        let jsonParser = JsonParser()
        jsonParser.alimentoJson = "aleatorio"
        
        // When
        let alimentosJS = jsonParser.parsingAlimentos()
        
        // Then
        XCTAssertTrue(alimentosJS.isEmpty)
    }
    
    func test_JsonParser_populateAlimentoCD_Bool() {
        // Given
        let jsonParser = JsonParser()
        
        // When
        let resultPopulate = jsonParser.populateAlimentoCD()
        
        // Then
        XCTAssertTrue(resultPopulate)
    }
    
    func test_JsonParser_parsingSubstitutos_ArrayFull() {
        // Given
        let jsonParser = JsonParser()
        
        // When
        let substitutosJS = jsonParser.parsingSubstitutos()
        
        // Then
        XCTAssertNotNil(substitutosJS)
    }
    
    func test_JsonParser_parsingSubstitutos_ArrayEmpty() {
        // Given
        let jsonParser = JsonParser()
        jsonParser.substitutoJson = "Random"
        
        // When
        let substitutosJS = jsonParser.parsingSubstitutos()
        
        // Then
        XCTAssertTrue(substitutosJS.isEmpty)
    }
    
    func test_JsonParser_populateSubstitutosCD_Bool() {
        // Given
        let jsonParser = JsonParser()
        
        // When
        let resultPopulate = jsonParser.populateSubstitutosCD()
        
        // Then
        XCTAssertTrue(resultPopulate)
    }
    
    func test_JsonParser_addSubstitutosToAlimentos_Bool() {
        // Given
        let jsonParser = JsonParser()
        
        // When
        let resultAdd = jsonParser.addSubstitutosToAlimentos()
        
        // Then
        XCTAssertTrue(resultAdd)
    }
}
