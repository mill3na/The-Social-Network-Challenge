//
//  ProfileView.swift
//  The Social Network Challenge
//
//  Created by Natalia Locatelli Barbosa on 17/08/22.
//

import Foundation

import SwiftUI

struct ProfileView: View {
    @State var ourUser = User(email: "milenaENatalia@gmail.com", name: "Milena e Natália", id: "3fa85f64-5717-4562-b3fc-2c963f66az84")
    var body: some View {
        NavigationView {
                List {
                    Section {
                        Text("User name: \(ourUser.name)")
                        Text("User email: \(ourUser.email)")
                        Text("User id: \(ourUser.id)")
                        
                    } // section
                } // list
            }
            .navigationTitle("Profile")
            .frame(maxWidth: .infinity)
            .background {
                LinearGradient(
                    gradient: .init(colors: [Color.blue,Color.white]), startPoint: .top, endPoint: .bottom
                )
            }
            .ignoresSafeArea(.all)
        }
    }

