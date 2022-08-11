//
//  APIStructs.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import Foundation

struct Posts: Codable {
    let user_id: String
    let media: String?
    let like_count: Int
    let created_at: String
    let updated_at: String
    let content: String
}


struct Users: Codable {
//    O codable serve para fazer a tradução de dados do tipo json nos dados que vamos usar no código
//    Os nomes devem ser os mesmos que a API chama para que a conversão do Decoder funcione!
    
    let email: String
    let name: String
    let id: String
}

