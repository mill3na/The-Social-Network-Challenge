//
//  PostService.swift
//  The Social Network Challenge
//
//  Created by Natalia Locatelli Barbosa on 17/08/22.
//

import Foundation


class PostsService{
    func getAllPosts() async throws -> [Post]{
        do {
            guard let url = URL(string: "http://adaspace.local/posts") else { return [] }
            
            let (postRequest, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let jsonResult = try decoder.decode([Post].self, from: postRequest)
            return jsonResult
            
        } catch {
            print(error)
        }
        return []
    }
    init(){}
}
