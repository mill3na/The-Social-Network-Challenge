//
//  APIStructs.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import Foundation

struct Post: Codable {
    let id: String
    let content: String
    let media: String?
    let user_id: String
    let created_at: Date
    let updated_at: Date
}
