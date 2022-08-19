//
//  User.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 17/08/22.
//

import Foundation

struct User: Codable, Identifiable {
//    O codable serve para fazer a tradução de dados do tipo json nos dados que vamos usar no código
//    Os nomes devem ser os mesmos que a API chama para que a conversão do Decoder funcione!
    
    let email: String
    let name: String
    let id: String
}

