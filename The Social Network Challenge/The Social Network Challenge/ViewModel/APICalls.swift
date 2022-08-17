//
//  API.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import Foundation
import SwiftKeychainWrapper

let key = "user-token"


// implemented api communication
func getUsers(completion: @escaping (([User]) -> ())) {
    let url = URL(string: "http://adaspace.local/users")!

    let task = URLSession.shared.dataTask(with: url){

        data, response, error in
        guard let dataResponse = data else {return }

        do {let allUsers = try JSONDecoder().decode([User].self, from: dataResponse)
//            print("object posts: (posts)")
            completion(allUsers)
        } catch {
            print("ERROR: \(error)")
        }
    }

    task.resume() // faz a chamada acontecer
}

func createNewUser(newUser: NewUser) async -> Session? {
    let url = URL(string: "http://adaspace.local/users")
    var urlRequest = URLRequest(url: url!)

    let enconder = JSONEncoder()
    let payload = try! enconder.encode(newUser)
    
    urlRequest.httpMethod = "POST"
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")
    urlRequest.httpBody = payload
    
    do {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let decodedCreateUserSession: Session = try JSONDecoder().decode(Session.self, from: data)
        print(decodedCreateUserSession)
        return decodedCreateUserSession
    } catch {
        print(error)
    }
    
    return nil
}


func getPosts() async -> [Post] {

        let url = URL(string: "http://adaspace.local/posts")
        var urlRequest = URLRequest(url: url!)

        urlRequest.httpMethod = "GET"

        do {
            let decoder = JSONDecoder()
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withFullDate]

            decoder.dateDecodingStrategy = .custom({ decoder in
                let container = try decoder.singleValueContainer()
                let dateString = try container.decode(String.self)

                if let date = formatter.date(from: dateString) {
                    return date
                }

                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string (dateString)")
            })

            do {
                let (data, _) = try await URLSession.shared.data(for: urlRequest)
                let allPosts = try decoder.decode([Post].self, from: data)
                print(decoder)
                for i in allPosts {
                    print(i)
                }
                return allPosts
            } catch {
                fatalError("ERROR: (error)")
            }
        }
    }


func separatePostsWithWithoutMedia (_ posts: [Post]) -> ([Post], [Post]){
    var postsWithMedia:[Post] = []
    var textPosts: [Post] = []
    for post in posts{
        if post.media == nil {
            textPosts.append(post)
        }
        else{
            postsWithMedia.append(post)
        }
    }

    return (postsWithMedia, textPosts)
}


func saveToken(_ token: String, _ email: String) -> Bool{
    let key = "user-token"
    let saveTokenStatus: Bool = KeychainWrapper.standard.set(token, forKey: key)
    
    if saveTokenStatus == false{
        print("Unable to save user's token.")
    } else {
        return true
    }
    
    return false
}

func readToken(_ token: String) -> String? {
    let key = "user-token"
    
    let retrieveToken: String? = KeychainWrapper.standard.string(forKey: key)
    if let userToken = retrieveToken{
        return userToken
    } else {
        print("Unable to access user token with parameters \(token), \(key)")
        return nil
    }
}

func deleteToken (_ token: String) -> Bool {
    let key = "user-token"
    
    let removeTokenStatus: Bool = KeychainWrapper.standard.removeObject(forKey: key)
    return false
}
