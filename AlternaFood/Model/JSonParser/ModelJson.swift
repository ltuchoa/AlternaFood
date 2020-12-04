//
//  ModelJson.swift
//  AlternaFood
//
//  Created by Leonardo Gomes on 23/11/20.
//

import Foundation

struct JSAlimento: Codable {
    let alimentoID: String
    let aliemntoNome: String
    let alimentoFoto: String
    let alimentoSubstitutos: [String]
}

struct JSSubstituto: Codable {
    let substitutoID: String
    let substitutoNome: String
    let substitutoDescricao: String
    let substitutoFoto: String
    let substitutoIcon: String
    let substitutoDosAlimentosID: [String]
    let substitutoReceitas: [JSReceita]?
}

struct JSReceita: Codable {
    let idAlimento: String
    let idSubstituto: String
    let idReceita: String
    let nome: String
    let porcoes: String
    let tempo: String
    let ingredientes: [String]
    let preparo: [String]
    let pathFoto: String
    
}
