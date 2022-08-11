//
//  API.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import Foundation


// implemented api communication
func getUsers(completion: @escaping (([Users]) -> ())) {
    let url = URL(string: "http://adaspace.local/users")!
    
    let task = URLSession.shared.dataTask(with: url){
        
        data, response, error in
        guard let dataResponse = data else {return }
        
        do {let allUsers = try JSONDecoder().decode([Users].self, from: dataResponse)
//            print("object posts: \(posts)")
            completion(allUsers)
        } catch let error{
            print("ERROR: \(error)")
        }
    }

    task.resume() // faz a chamada acontecer
}

func APIRequestPosts(completion: @escaping (([Posts]) -> ())){
    let url = URL(string: "http://adaspace.local/posts")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
        guard let dataResponse = data else {return}
        
        do {
            let allPosts = try JSONDecoder().decode([Posts].self, from: dataResponse)
            completion(allPosts)
        }
        
        catch let error {
            print("ERROR\(error)")
        }
    }
    task.resume()
}
