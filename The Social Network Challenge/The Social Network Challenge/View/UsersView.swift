//
//  UsersView.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 15/08/22.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject private var viewModel = ViewModel()

    @State var users: [User] = []
    var body: some View {
        NavigationView{
            List {
                Section {
                    ForEach(users) { user in
                        NavigationLink {
                            ScrollView {
                                VStack {
                                    Text(user.email)
                                }
                            }
                        } label:{
                            HStack{
                                Text(user.name).padding()
                                Spacer()
                                Image(systemName: "heart").padding()
                            } //hstack
                        } // label
                    }
                    
                } // section
            } // list
            .navigationTitle("Find Users")
            .onAppear {
                viewModel.getUsers { users in
                    self.users = users
                    print(users)
                }
            }
            
        } // nav view
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
