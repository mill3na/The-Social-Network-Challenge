//
//  ContentView.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import SwiftUI

struct HomeScreenView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    @State var index = 0
    
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
                    
                } .task {
                    await viewModel.getPosts()
                }
                
            }
            .background(
                LinearGradient(gradient: .init(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
            .navigationTitle("Explore")
        }
    }
    
    func buildPost(_ post: Post)-> some View{
            
            let initialURL: String = "http://adaspace.local/"
            let media: String = post.media ?? ""
            let url = initialURL + media
            
            return VStack{
                GroupBox(label: Text(""),
                         content: {
                    
                    if !media.isEmpty{
                        AsyncImage(url: URL(string: url))
                            .frame(
                                width: UIScreen.main.bounds.width*0.9
                            )
                    }
                    
                    
                    Text("\n \(post.content)")
                }
                    
                )
                .frame(width: UIScreen.main.bounds.width*0.9)
                    .cornerRadius(10)
                
                
            }
        }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
