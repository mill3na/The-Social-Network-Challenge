//
//  ContentView.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import SwiftUI

struct HomeScreenView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack{
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    Spacer()
                    ForEach(viewModel.posts, id: \.id) { post in
                        buildPost(post)
                    }
                    
                }
            }
            .background(
                LinearGradient(gradient: .init(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
            .navigationTitle("Explore Pic Me")
        }
        .task {
            await viewModel.getPost()
        }
    }
    
    func buildPost(_ post: Post)-> some View {
        PostView(post: post, viewModel: viewModel)
    }
}

struct PostView: View {
    
    let post: Post
    
    @ObservedObject var viewModel: ViewModel
    
    @State var user: User?
    
    var body: some View {
        let initialURL: String = "http://adaspace.local/"
        let media: String = post.media ?? ""
        let url = initialURL + media
        
        VStack {
            GroupBox(
                
                label: Text(""),
                content: {
                    if !media.isEmpty{
                        AsyncImage(url: URL(string: url))
                            .frame(
                                width: UIScreen.main.bounds.width*0.9,
                                height: 200
                                
                            )
                    }
                    Text("\n \(post.content)")
                    if let user = user {
                        let userName =  user.name == "" ? "Unknow user" : user.name
                        Text(userName)
                    }
                    
                }
            )
            .frame(width: UIScreen.main.bounds.width*0.9)
            .cornerRadius(10)
        }
        .onAppear {
            viewModel.getUserById(post.user_id) { user in
                self.user = user
            }
        }
    }
    
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
