//
//  ContentView.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 11/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var users: [Users] = []
    
    var body: some View {
        VStack{
            Text("The Social Network Challenge.")
            
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
            }
            .onAppear {
                getUsers { users in
                    self.users = users
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
