//
//  API.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import Foundation


// implemented api communication
func getUsers(completion: @escaping (([Users]) -> ())) {
    let url = URL(string: "http://adaspace.local/users%22)!

    let task = URLSession.shared.dataTask(with: url){

        data, response, error in
        guard let dataResponse = data else {return }

        do {let allUsers = try JSONDecoder().decode([Users].self, from: dataResponse)
//            print("object posts: (posts)")
            completion(allUsers)
        } catch let error{
            print("ERROR: (error)")
        }
    }

    task.resume() // faz a chamada acontecer
}

func getPosts(completion: @escaping (([Posts]) -> ())){
    let url = URL(string: "http://adaspace.local/posts%22)!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in

        guard let dataResponse = data else {return}

        do {
            let allPosts = try JSONDecoder().decode([Posts].self, from: dataResponse)
            completion(allPosts)
        }

        catch let error {
            print("ERROR: (error)")
        }
    }
    task.resume()
}

func separatePostsWithWithoutMedia (_ posts: [Posts]) -> ([Posts], [Posts]){
    var postsWithMedia:[Posts] = []
    var textPosts: [Posts] = []
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
