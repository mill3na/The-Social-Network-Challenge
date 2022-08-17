//
//  NewUser.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 17/08/22.
//

import Foundation

struct NewUser: Codable {
    let name: String
    let email: String
    let password: String
}

struct Session: Codable {
    let token: String
    let user: User
}
