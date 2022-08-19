//
//  ContentView.swift
//  The Social Network Challenge
//
//  Created by Milena Maia Araújo on 15/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
//            FavoritesView()
//                .tabItem {
//                    Label("Favorites", systemImage: "heart")
//                }
            
            UsersView()
                .tabItem{
                    Label("Users", systemImage: "magnifyingglass")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
