//
//  ContentView.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State var users: [Users] = []
    
    var body: some View {
        NavigationView{
        VStack{
            ScrollView{
                // where the posts are
            }
            
            ZStack{
                Rectangle()
                    .fill(.mint)
                    .frame(width: 370, height: 200)
                    .cornerRadius(15)
                    .padding()
                if let user = users.first {
                    VStack {
                        Text("Numero de usuarios: \(users.count)")
                        Text(user.id)
                        Text(user.name)
                        Text(user.email)
                        
                    }
                    
                }
            } // zstack
            .onAppear {
                getUsers { users in
                    self.users = users
                    print(users)
                }
            }
        } // vstack
    }
    }
}

